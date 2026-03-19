-- Thay 'M01' bằng mã độc giả (member_id) thực tế trong database của bạn
SELECT dbo.fn_TongTienPhat('M01') AS TongTienPhat;

-- Lấy số cuốn sách chưa trả của độc giả có mã 'M02'
SELECT dbo.fn_SoSachDangMuon('M02') AS SoSachDangMuon;

-- Lấy toàn bộ danh sách sách quá hạn
SELECT * FROM dbo.fn_DanhSachSachQuaHan();

-- Kiểm tra số lượng bản sao của sách có mã 'B01'
SELECT dbo.fn_SoLuongBanSao('B19') AS SoLuongBanSaoHienCo;

-- Lấy danh sách (book_id, name_book, category_name, publisher_name) 
-- của các sách thuộc thể loại có mã 'C1'
SELECT * FROM dbo.fn_SachTheoTheLoai('C1');
