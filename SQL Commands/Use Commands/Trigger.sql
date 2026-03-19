-- Khi thực thi lệnh UPDATE này, trg_update_fine sẽ tự động chạy
UPDATE loan_detail
SET return_date = '2024-11-20' -- Hoặc dùng GETDATE() cho ngày hôm nay
WHERE loan_id = 'LN01' AND book_copy_id = 'BC01'; 


-- Thực thi lệnh INSERT này để kích hoạt 3 trigger trên cùng lúc
INSERT INTO loan_detail (loan_id, book_copy_id, return_date, overdue_date, sum_of_fine)
VALUES 
('LN25', 'BC41', NULL, NULL, 0); 


-- Lệnh này có thể thành công hoặc bị báo lỗi RAISERROR (rollback) tuỳ vào dữ liệu thực tế.


-- Cố gắng xóa một đầu sách
DELETE FROM book
WHERE book_id = 'B01';

-- Nếu đầu sách số 1 vẫn còn dữ liệu trong bảng 'book_copy', trigger sẽ báo lỗi và ngăn chặn lệnh DELTE này rủi ro xóa nhầm.
