USE Group4
GO

-- Xóa các function nếu đã tồn tại
IF OBJECT_ID('fn_TongTienPhat') IS NOT NULL DROP FUNCTION fn_TongTienPhat;
IF OBJECT_ID('fn_SoSachDangMuon') IS NOT NULL DROP FUNCTION fn_SoSachDangMuon;
IF OBJECT_ID('fn_DanhSachSachQuaHan') IS NOT NULL DROP FUNCTION fn_DanhSachSachQuaHan;
IF OBJECT_ID('fn_SoLuongBanSao') IS NOT NULL DROP FUNCTION fn_SoLuongBanSao;
IF OBJECT_ID('fn_SachTheoTheLoai') IS NOT NULL DROP FUNCTION fn_SachTheoTheLoai;
GO

-- 1. Function (Scalar): Tính tổng số tiền phạt của một độc giả bất kỳ
CREATE FUNCTION fn_TongTienPhat (@member_id VARCHAR(20))
RETURNS FLOAT
AS
BEGIN
    DECLARE @TongTien FLOAT = 0;
    SELECT @TongTien = SUM(ISNULL(ld.sum_of_fine, 0))
    FROM loan l
    JOIN loan_detail ld ON l.loan_id = ld.loan_id
    WHERE l.member_id = @member_id;

    RETURN ISNULL(@TongTien, 0);
END
GO

-- 2. Function (Scalar): Đếm số lượng sách đang mượn (chưa trả) của một độc giả
CREATE FUNCTION fn_SoSachDangMuon (@member_id VARCHAR(20))
RETURNS INT
AS
BEGIN
    DECLARE @SoSach INT = 0;
    SELECT @SoSach = COUNT(*)
    FROM loan l
    JOIN loan_detail ld ON l.loan_id = ld.loan_id
    WHERE l.member_id = @member_id AND ld.return_date IS NULL;

    RETURN @SoSach;
END
GO

-- 3. Function (Table-valued): Lấy danh sách các cuốn sách đang quá hạn chưa trả của hệ thống
CREATE FUNCTION fn_DanhSachSachQuaHan ()
RETURNS TABLE
AS
RETURN (
    SELECT 
        l.member_id, 
        m.name AS member_name, 
        bc.book_id, 
        b.name_book, 
        ld.overdue_date,
        DATEDIFF(DAY, ld.overdue_date, GETDATE()) AS days_overdue
    FROM loan l
    JOIN member m ON l.member_id = m.member_id
    JOIN loan_detail ld ON l.loan_id = ld.loan_id
    JOIN book_copy bc ON ld.book_copy_id = bc.book_copy_id
    JOIN book b ON bc.book_id = b.book_id
    WHERE ld.return_date IS NULL AND ld.overdue_date < GETDATE()
);
GO

-- 4. Function (Scalar): Đếm số lượng bản sao (book copy) hiện có của một đầu sách cụ thể
CREATE FUNCTION fn_SoLuongBanSao (@book_id VARCHAR(20))
RETURNS INT
AS
BEGIN
    DECLARE @SoLuong INT = 0;
    SELECT @SoLuong = COUNT(*)
    FROM book_copy
    WHERE book_id = @book_id;

    RETURN @SoLuong;
END
GO

-- 5. Function (Table-valued): Lấy danh sách các sách thuộc một thể loại cụ thể
CREATE FUNCTION fn_SachTheoTheLoai (@category_id VARCHAR(20))
RETURNS TABLE
AS
RETURN (
    SELECT 
        b.book_id,
        b.name_book,
        c.category_name,
        p.publisher_name
    FROM book b
    JOIN book_category bc ON b.book_id = bc.book_id
    JOIN category c ON bc.category_id = c.category_id
    LEFT JOIN publisher p ON b.publisher_id = p.publisher_id
    WHERE c.category_id = @category_id
);
GO
