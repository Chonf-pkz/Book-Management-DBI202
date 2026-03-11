--q1 Liệt kê sách đã trả (return_date không NULL)
SELECT loan_id, book_copy_id, return_date
FROM LOAN_DETAIL
WHERE return_date IS NOT NULL;


--q2 Cho biết tên sách và mã bản sao chưa trả (return_date là NULL)
SELECT b.name_book, ld.book_copy_id
FROM LOAN_DETAIL ld
JOIN BOOK_COPY bc ON ld.book_copy_id = bc.book_copy_id
JOIN BOOK b ON bc.book_id = b.book_id
WHERE ld.return_date IS NULL;

--q3 Thống kê số lượng sách mỗi mã đơn mượn đang mượn
SELECT loan_id, COUNT(book_copy_id) AS so_luong_sach_dang_muon
FROM LOAN_DETAIL
WHERE return_date IS NULL
GROUP BY loan_id;

--q4 Tìm sách có ngày quá hạn trước tháng 02/2026
SELECT ld.book_copy_id, b.name_book
FROM LOAN_DETAIL ld
JOIN BOOK_COPY bc ON ld.book_copy_id = bc.book_copy_id
JOIN BOOK b ON bc.book_id = b.book_id
WHERE ld.overdue_date < '2026-02-01';

--q5 Tính tổng số lượng bản sao hiện có cho từng đầu sách
SELECT b.book_id, b.name_book, COUNT(bc.book_copy_id) AS so_luong_ban_sao
FROM BOOK b
LEFT JOIN BOOK_COPY bc ON b.book_id = bc.book_id
GROUP BY b.book_id, b.name_book;

--q6 Liệt kê chi tiết mượn của đơn 'LN01'
SELECT b.name_book, l.loan_date, ld.overdue_date
FROM LOAN_DETAIL ld
JOIN LOAN l ON ld.loan_id = l.loan_id
JOIN BOOK_COPY bc ON ld.book_copy_id = bc.book_copy_id
JOIN BOOK b ON bc.book_id = b.book_id
WHERE l.loan_id = 'LN01';