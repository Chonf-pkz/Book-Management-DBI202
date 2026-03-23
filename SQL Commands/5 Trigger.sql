-----Tự động cập nhật tiền phạt khi trả sách-------



CREATE TRIGGER trg_update_fine
ON loan_detail
AFTER UPDATE
AS
BEGIN

UPDATE loan_detail
SET sum_of_fine =
CASE
    WHEN i.return_date > i.overdue_date
    THEN DATEDIFF(day,i.overdue_date,i.return_date) * p.fine_amount
    ELSE 0
END

FROM loan_detail ld
JOIN inserted i ON ld.book_copy_id = i.book_copy_id
JOIN loan l ON l.loan_id = i.loan_id
JOIN policy_rule p ON p.policy_id = l.policy_id

END


-----------Không cho mượn book_copy đã được mượn-------

CREATE TRIGGER trg_no_duplicate_borrow
ON loan_detail
INSTEAD OF INSERT
AS
BEGIN

IF EXISTS(
SELECT *
FROM loan_detail ld
JOIN inserted i
ON ld.book_copy_id = i.book_copy_id
WHERE ld.return_date IS NULL
)

BEGIN
RAISERROR('Book copy already borrowed',16,1)
ROLLBACK
END

ELSE

BEGIN

INSERT INTO loan_detail
SELECT * FROM inserted

END

END


---------Giới hạn số sách được mượn theo policy-----------



Create TRIGGER trg_limit_books
ON policy_rule
AFTER INSERT
AS
BEGIN
    UPDATE policy_rule
    SET expiry_date = DATEADD(year, 1, i.effective_date)
    FROM policy_rule p
    JOIN inserted i ON p.policy_id = i.policy_id
END

-------Tự động tạo overdue_date khi thêm loan_detail--------


CREATE TRIGGER trg_auto_overdue
ON loan_detail
AFTER INSERT
AS
BEGIN

UPDATE loan_detail
SET overdue_date =
DATEADD(day,p.maximum_loan_period,l.loan_date)

FROM loan_detail ld
JOIN inserted i ON ld.loan_id = i.loan_id
JOIN loan l ON l.loan_id=i.loan_id
JOIN policy_rule p ON p.policy_id=l.policy_id

END


-----Không cho xóa book nếu còn book_copy---------


CREATE TRIGGER trg_no_delete_book
ON book
INSTEAD OF DELETE
AS
BEGIN

IF EXISTS(

SELECT *
FROM book_copy bc
JOIN deleted d
ON bc.book_id=d.book_id

)

BEGIN

RAISERROR('Cannot delete book with copies',16,1)
ROLLBACK

END

ELSE

BEGIN

DELETE FROM book
WHERE book_id IN (SELECT book_id FROM deleted)

END

END




---ràng buộc các book copy chung 1 loan ---

CREATE TRIGGER trg_same_return_date
ON loan_detail
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT loan_id
        FROM loan_detail
        WHERE loan_id IN (SELECT loan_id FROM inserted)
        AND return_date IS NOT NULL
        GROUP BY loan_id
        HAVING COUNT(DISTINCT return_date) > 1
    )
    BEGIN
        RAISERROR('Return date must be the same for the same loan',16,1)
        ROLLBACK TRANSACTION
    END
END
