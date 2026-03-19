-- 1. Thống kê tổng số lượng sách mà mỗi tác giả đã viết
CREATE VIEW v_TotalBooksByAuthor AS
SELECT a.author_name, COUNT(ba.book_id) AS total_books
FROM author a
JOIN book_of_author ba ON a.author_id = ba.author_id
GROUP BY a.author_id, a.author_name;


-- 2. Thống kê tổng số lần mượn sách của từng thành viên
CREATE VIEW v_MemberLoanCount AS
SELECT m.name, COUNT(l.loan_id) AS total_loans
FROM member m
JOIN loan l ON m.member_id = l.member_id
GROUP BY m.member_id, m.name;

-- 3. Thống kê tổng tiền phạt thu được theo từng chính sách
CREATE VIEW v_TotalFineByPolicy AS
SELECT p.policy_id, SUM(ld.sum_of_fine) AS total_fine
FROM policy_rule p
JOIN loan l ON p.policy_id = l.policy_id
JOIN loan_detail ld ON l.loan_id = ld.loan_id
GROUP BY p.policy_id;


-- 4. Thống kê tổng số lượng bản sao hiện có của mỗi đầu sách
CREATE VIEW v_BookCopyCount AS
SELECT b.name_book, COUNT(bc.book_copy_id) AS total_copies
FROM book b
JOIN book_copy bc ON b.book_id = bc.book_id
GROUP BY b.book_id, b.name_book;


-- 5. Thống kê số lượng sách chưa trả (đang mượn) của từng thành viên
CREATE VIEW v_UnreturnedBooksByMember AS
SELECT m.name, COUNT(ld.book_copy_id) AS unreturned_books
FROM member m
JOIN loan l ON m.member_id = l.member_id
JOIN loan_detail ld ON l.loan_id = ld.loan_id
WHERE ld.return_date IS NULL
GROUP BY m.member_id, m.name;
