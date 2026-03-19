-- 1. Xem thống kê tổng số lượng sách mà mỗi tác giả đã viết
SELECT * FROM v_TotalBooksByAuthor;

-- Nếu muốn sắp xếp theo số lượng sách giảm dần:
SELECT * FROM v_TotalBooksByAuthor ORDER BY total_books DESC;


-- 2. Xem thống kê tổng số lần mượn sách của từng thành viên
SELECT * FROM v_MemberLoanCount;

-- Nếu muốn tìm những thành viên mượn nhiều hơn 1 lần:
SELECT * FROM v_MemberLoanCount WHERE total_loans >= 0;


-- 3. Xem thống kê tổng tiền phạt thu được theo từng chính sách
SELECT * FROM v_TotalFineByPolicy;


-- 4. Xem thống kê tổng số lượng bản sao hiện có của mỗi đầu sách
SELECT * FROM v_BookCopyCount;

-- Nếu muốn lọc ra những sách có nhiều hơn 10 bản sao:
SELECT * FROM v_BookCopyCount WHERE total_copies > 2;


-- 5. Xem thống kê số lượng sách chưa trả (đang mượn) của từng thành viên
SELECT * FROM v_UnreturnedBooksByMember;

-- Xem những người đang giữ chưa trả từ 3 cuốn sách trở lên:
SELECT * FROM v_UnreturnedBooksByMember WHERE unreturned_books >= 3;
