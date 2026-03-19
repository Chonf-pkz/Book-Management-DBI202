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
ON loan_detail
AFTER INSERT
AS
BEGIN

    IF EXISTS(
        SELECT m.member_id
        FROM inserted i
        JOIN loan l ON l.loan_id = i.loan_id
        JOIN member m ON m.member_id = l.member_id
        JOIN policy_rule p ON p.policy_id = l.policy_id
        WHERE (
            SELECT COUNT(*)
            FROM loan_detail ld
            JOIN loan l2 ON ld.loan_id=l2.loan_id
            WHERE l2.member_id = m.member_id
            AND ld.return_date IS NULL
        ) >= p.maximum_loan_period
    )
    BEGIN
        RAISERROR('Borrow limit exceeded',16,1)
        ROLLBACK
    END

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
