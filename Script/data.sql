-- 20 Members
INSERT INTO member (member_id, name, address, phone_number) VALUES 
('M01', 'James Bond', 'London, UK', '007007007'), ('M02', 'Tony Stark', 'Malibu, USA', '012345678'),
('M03', 'Bruce Wayne', 'Gotham City', '0999888777'), ('M04', 'Peter Parker', 'Queens, NY', '011223344'),
('M05', 'Clark Kent', 'Metropolis', '0555666777'), ('M06', 'Diana Prince', 'Themyscira', '0888000111'),
('M07', 'Steve Rogers', 'Brooklyn, NY', '019411941'), ('M08', 'Natasha Romanoff', 'Moscow, Russia', '0777555333'),
('M09', 'Wanda Maximoff', 'Sokovia', '0444222111'), ('M10', 'Stephen Strange', 'Bleecker St, NY', '0111999222'),
('M11', 'Thor Odinson', 'Asgard', '000000001'), ('M12', 'Loki Laufeyson', 'Asgard', '000000002'),
('M13', 'Arthur Curry', 'Atlantis', '0222333444'), ('M14', 'Barry Allen', 'Central City', '0333444555'),
('M15', 'Hal Jordan', 'Coast City', '0444555666'), ('M16', 'Victor Stone', 'Detroit, MI', '0555666777'),
('M17', 'Oliver Queen', 'Star City', '0666777888'), ('M18', 'John Constantine', 'Liverpool, UK', '0777888999'),
('M19', 'Lucifer Morningstar', 'Los Angeles', '066666666'), ('M20', 'Mazikeen Smith', 'Hell', '0999666333');

-- 5 Categories & 5 Authors & 5 Publishers
INSERT INTO category VALUES ('C1', 'Fiction'), ('C2', 'Computing'), ('C3', 'History'), ('C4', 'Science'), ('C5', 'Fantasy');
INSERT INTO author VALUES ('A1', 'J.K. Rowling'), ('A2', 'George Orwell'), ('A3', 'Robert Martin'), ('A4', 'Stephen King'), ('A5', 'Elon Musk');
INSERT INTO publisher VALUES ('P1', 'Oxford Press'), ('P2', 'Pearson'), ('P3', 'O-Reilly'), ('P4', 'HarperCollins'), ('P5', 'Penguin');

-- 3 Librarians & 2 Admins
INSERT INTO librarian VALUES ('L01', 'Sarah Connor'), ('L02', 'Ellen Ripley'), ('L03', 'John McClane');
INSERT INTO administrator VALUES ('ADM1', 'Nick Fury', 'fury@shield.gov', '0911911911'), ('ADM2', 'Maria Hill', 'hill@shield.gov', '0911911912');

-- 2 Policies
INSERT INTO policy_rule VALUES 
('POL1', 'ADM1', '2026-01-01', '2026-12-31', 2.0, 14),
('POL2', 'ADM2', '2026-01-01', '2026-12-31', 5.0, 7);

-- 20 Books
INSERT INTO book VALUES 
('B01', 'P1', 'L01', 'Harry Potter 1', '1997-06-26'), ('B02', 'P1', 'L01', 'Harry Potter 2', '1998-07-02'),
('B03', 'P2', 'L02', 'Clean Code', '2008-08-01'), ('B04', 'P3', 'L03', 'SQL Performance', '2020-05-12'),
('B05', 'P4', 'L01', '1984', '1949-06-08'), ('B06', 'P5', 'L02', 'The Shining', '1977-01-28'),
('B07', 'P2', 'L03', 'Java Design Patterns', '2015-10-10'), ('B08', 'P3', 'L01', 'Python Basics', '2021-02-20'),
('B09', 'P4', 'L02', 'World War II', '2010-05-05'), ('B10', 'P5', 'L03', 'SpaceX History', '2023-11-11'),
('B11', 'P1', 'L01', 'The Hobbit', '1937-09-21'), ('B12', 'P2', 'L02', 'Data Structures', '2019-03-15'),
('B13', 'P3', 'L03', 'AI Revolution', '2024-01-01'), ('B14', 'P4', 'L01', 'Cyber Security', '2022-07-07'),
('B15', 'P5', 'L02', 'Digital Marketing', '2018-09-09'), ('B16', 'P1', 'L03', 'Chemistry 101', '2017-04-04'),
('B17', 'P2', 'L01', 'Modern Physics', '2016-03-03'), ('B18', 'P3', 'L02', 'Database Internals', '2020-08-08'),
('B19', 'P4', 'L03', 'Economics Today', '2021-12-12'), ('B20', 'P5', 'L01', 'Psychology 101', '2019-06-06');

-- 20 Book Copies
INSERT INTO book_copy VALUES 
('BC01', 'B01'), ('BC02', 'B02'), ('BC03', 'B03'), ('BC04', 'B04'), ('BC05', 'B05'),
('BC06', 'B06'), ('BC07', 'B07'), ('BC08', 'B08'), ('BC09', 'B09'), ('BC10', 'B10'),
('BC11', 'B11'), ('BC12', 'B12'), ('BC13', 'B13'), ('BC14', 'B14'), ('BC15', 'B15'),
('BC16', 'B16'), ('BC17', 'B17'), ('BC18', 'B18'), ('BC19', 'B19'), ('BC20', 'B20');

-- 10 Loan Records (Mỗi người mượn khoảng 2 cuốn)
INSERT INTO loan VALUES 
('LN01', 'M01', 'L01', 'POL1', '2026-01-01'), ('LN02', 'M02', 'L02', 'POL1', '2026-01-05'),
('LN03', 'M03', 'L03', 'POL2', '2026-01-10'), ('LN04', 'M04', 'L01', 'POL1', '2026-01-15'),
('LN05', 'M05', 'L02', 'POL2', '2026-01-20'), ('LN06', 'M06', 'L03', 'POL1', '2026-01-25'),
('LN07', 'M07', 'L01', 'POL1', '2026-01-28'), ('LN08', 'M08', 'L02', 'POL2', '2026-01-29'),
('LN09', 'M09', 'L03', 'POL1', '2026-01-30'), ('LN10', 'M10', 'L01', 'POL2', '2026-01-31');

-- 20 Loan Details (Chi tiết mượn)
INSERT INTO loan_detail (loan_id, book_copy_id, overdue_date, return_date, sum_of_fine) VALUES 
('LN01', 'BC01', '2026-01-15', '2026-01-16', 2.0),  -- Trả cùng ngày 16/01
('LN01', 'BC02', '2026-01-15', '2026-01-16', 2.0),
('LN02', 'BC03', '2026-01-19', NULL, 0),             -- Có 1 cuốn chưa trả -> đồng bộ NULL
('LN02', 'BC04', '2026-01-19', NULL, 0),
('LN03', 'BC05', '2026-01-17', NULL, 0),             -- Có 1 cuốn chưa trả -> đồng bộ NULL
('LN03', 'BC06', '2026-01-17', NULL, 0),
('LN04', 'BC07', '2026-01-29', NULL, 0),             -- Có 1 cuốn chưa trả -> đồng bộ NULL
('LN04', 'BC08', '2026-01-29', NULL, 0),
('LN05', 'BC09', '2026-01-27', '2026-01-30', 15.0),  -- Trả cùng ngày 30/01 (trễ 3 ngày, phạt 15$)
('LN05', 'BC10', '2026-01-27', '2026-01-30', 15.0),
('LN06', 'BC11', '2026-02-08', NULL, 0), 
('LN06', 'BC12', '2026-02-08', NULL, 0),
('LN07', 'BC13', '2026-02-11', NULL, 0), 
('LN07', 'BC14', '2026-02-11', NULL, 0),
('LN08', 'BC15', '2026-02-05', NULL, 0), 
('LN08', 'BC16', '2026-02-05', NULL, 0),
('LN09', 'BC17', '2026-02-13', NULL, 0), 
('LN09', 'BC18', '2026-02-13', NULL, 0),
('LN10', 'BC19', '2026-02-07', NULL, 0), 
('LN10', 'BC20', '2026-02-07', NULL, 0);

INSERT INTO book_of_author (author_id, book_id) VALUES 
('A1', 'B01'), ('A1', 'B02'), ('A1', 'B11'), ('A1', 'B20'), 
('A2', 'B05'), ('A2', 'B09'), ('A2', 'B15'), ('A2', 'B19'), 
('A3', 'B03'), ('A3', 'B04'), ('A3', 'B07'), ('A3', 'B08'), 
('A3', 'B12'), ('A3', 'B14'), ('A3', 'B18'),               
('A4', 'B06'), ('A4', 'B16'), ('A4', 'B17'),               
('A5', 'B10'), ('A5', 'B13');                               

INSERT INTO book_category (book_id, category_id) VALUES 
('B01', 'C5'), ('B02', 'C5'), ('B11', 'C5'), -- Fantasy
('B03', 'C2'), ('B04', 'C2'), ('B07', 'C2'), -- Computing
('B08', 'C2'), ('B12', 'C2'), ('B14', 'C2'), -- Computing
('B15', 'C2'), ('B18', 'C2'),               -- Computing
('B05', 'C1'), ('B06', 'C1'), ('B20', 'C1'), -- Fiction
('B09', 'C3'), ('B19', 'C3'),               -- History
('B10', 'C4'), ('B13', 'C4'), ('B16', 'C4'), ('B17', 'C4'); -- Science

-- BỔ SUNG BOOK COPY (nhiều bản sao hơn cho mỗi sách hiện có)


INSERT INTO book_copy (book_copy_id, book_id) VALUES
('BC21', 'B01'), ('BC22', 'B01'), ('BC23', 'B01'),           -- Harry Potter 1: 4 bản
('BC24', 'B02'), ('BC25', 'B02'),                             -- Harry Potter 2: 3 bản
('BC26', 'B11'), ('BC27', 'B11'), ('BC28', 'B11');            -- The Hobbit: 4 bản


-- Clean Code & các sách Computing phổ biến → nhiều bản sao
INSERT INTO book_copy (book_copy_id, book_id) VALUES
('BC29', 'B03'), ('BC30', 'B03'), ('BC31', 'B03'), ('BC32', 'B03'),  -- Clean Code: 5 bản
('BC33', 'B07'), ('BC34', 'B07'),                                    -- Java Design Patterns: 3 bản
('BC35', 'B08'), ('BC36', 'B08');                                    -- Python Basics: 3 bản




-- Các sách khác: 2–3 bản sao
INSERT INTO book_copy (book_copy_id, book_id) VALUES
('BC37', 'B05'), ('BC38', 'B05'),          -- 1984
('BC39', 'B06'),                           -- The Shining
('BC40', 'B09'), ('BC41', 'B09'),          -- World War II
('BC42', 'B10'),                           -- SpaceX History
('BC43', 'B12'), ('BC44', 'B12'),          -- Data Structures
('BC45', 'B13'),                           -- AI Revolution
('BC46', 'B14'), ('BC47', 'B14'),          -- Cyber Security
('BC48', 'B15'),                           -- Digital Marketing
('BC49', 'B16'), ('BC50', 'B16'),          -- Chemistry 101
('BC51', 'B17'),                           -- Modern Physics
('BC52', 'B18'), ('BC53', 'B18'),          -- Database Internals
('BC54', 'B19'),                           -- Economics Today
('BC55', 'B20');



-- Thêm sách Science (chưa mượn)
INSERT INTO book (book_id, publisher_id, librarian_id, name_book, release) VALUES
('B21', 'P5', 'L02', 'Quantum Mechanics Fundamentals', '2022-08-15'),
('B22', 'P1', 'L03', 'Biology of the Cell 7th Ed', '2021-11-20'),
('B23', 'P3', 'L01', 'Introduction to Astrophysics', '2024-03-10');


----Thêm sách History & Fiction ít phổ biến (chưa mượn)

INSERT INTO book (book_id, publisher_id, librarian_id,name_book, release) VALUES
('B24', 'P4', 'L02', 'The Fall of Rome', '2018-06-05'),                -- History
('B25', 'P5', 'L03', 'Ancient Egypt Mysteries', '2019-09-12'),         -- History
('B26', 'P2', 'L01', 'Dune Messiah', '1969-01-01'),                    -- Fiction / Fantasy (ít mượn)
('B27', 'P1', 'L02', 'Foundation and Empire', '1952-01-01');           -- Fiction / Science Fiction


-- Gán tác giả cho sách mới
INSERT INTO book_of_author (author_id, book_id) VALUES
('A5', 'B21'),          -- giả sử Elon Musk viết về khoa học (hoặc thay bằng tác giả khác nếu muốn)
('A4', 'B26'),          -- Stephen King phong cách → nhưng ta gán cho vui
('A1', 'B27');          -- J.K. Rowling phong cách giả tưởng



-- Gán category cho sách mới (chủ yếu Science + ít History/Fiction)
INSERT INTO book_category (book_id, category_id) VALUES
('B21', 'C4'), ('B22', 'C4'), ('B23', 'C4'),     -- Science
('B24', 'C3'), ('B25', 'C3'),                    -- History (chưa có ai mượn)
('B26', 'C5'), ('B27', 'C5'),                    -- Fantasy
('B21', 'C2'), ('B23', 'C2');                    -- một số sách Science kiêm Computing


-- Thêm book_copy cho các sách mới (2–3 bản mỗi quyển)
INSERT INTO book_copy (book_copy_id, book_id) VALUES
('BC56', 'B21'), ('BC57', 'B21'), ('BC58', 'B21'),
('BC59', 'B22'), ('BC60', 'B22'),
('BC61', 'B23'), ('BC62', 'B23'), ('BC63', 'B23'),
('BC64', 'B24'), ('BC65', 'B24'),
('BC66', 'B25'), ('BC67', 'B25'),
('BC68', 'B26'), ('BC69', 'B26'),
('BC70', 'B27'), ('BC71', 'B27'), ('BC72', 'B27');




-- Thêm 5 loan mới (tháng 2/2026)
INSERT INTO loan (loan_id, member_id, librarian_id, policy_id, loan_date) VALUES
('LN11', 'M01', 'L01', 'POL1', '2026-02-05'),   -- James Bond mượn tiếp
('LN12', 'M03', 'L02', 'POL2', '2026-02-10'),   -- Bruce Wayne mượn tiếp
('LN13', 'M11', 'L03', 'POL1', '2026-02-15'),   -- Thor mượn
('LN14', 'M04', 'L01', 'POL1', '2026-02-20'),   -- Peter Parker mượn tiếp
('LN15', 'M19', 'L02', 'POL2', '2026-02-25');   -- Lucifer mượn



-- Loan detail mới (mượn thêm Harry Potter, Clean Code, và vài cuốn khác)
INSERT INTO loan_detail (loan_id, book_copy_id, overdue_date, return_date, sum_of_fine) VALUES
-- LN11 - James Bond mượn thêm Harry Potter
('LN11', 'BC22', '2026-02-19', NULL, 0),             -- Có 1 cuốn chưa trả -> đồng bộ NULL
('LN11', 'BC30', '2026-02-19', NULL, 0),             
-- LN12 - Bruce Wayne mượn muộn -> phạt
('LN12', 'BC05', '2026-02-24', '2026-03-01', 25.0),  -- Trả cùng ngày 01/03 (Năm 2026 T2 có 28 ngày, trễ 5 ngày -> phạt 25$)
('LN12', 'BC31', '2026-02-24', '2026-03-01', 25.0),  
-- LN13 - Thor mượn Fantasy & Science
('LN13', 'BC26', '2026-03-01', NULL, 0),             -- Có 1 cuốn chưa trả -> đồng bộ NULL
('LN13', 'BC47', '2026-03-01', NULL, 0),             
-- LN14 - Peter Parker mượn Computing
('LN14', 'BC33', '2026-03-06', '2026-03-04', 0),     
-- LN15 - Lucifer mượn Fiction
('LN15', 'BC44', '2026-03-11', NULL, 0);


-- Thêm 8 loan mới (tháng 2-3/2026)




INSERT INTO loan (loan_id, member_id, librarian_id, policy_id, loan_date) VALUES
('LN16', 'M12', 'L01', 'POL1', '2026-02-01'),   -- Loki mượn
('LN17', 'M14', 'L02', 'POL1', '2026-02-03'),   -- Barry Allen
('LN18', 'M17', 'L03', 'POL2', '2026-02-07'),   -- Oliver Queen
('LN19', 'M08', 'L01', 'POL1', '2026-02-12'),   -- Natasha Romanoff mượn lại
('LN20', 'M15', 'L02', 'POL1', '2026-02-18'),   -- Hal Jordan
('LN21', 'M20', 'L03', 'POL2', '2026-02-22'),   -- Mazikeen Smith
('LN22', 'M06', 'L01', 'POL1', '2026-03-01'),   -- Diana Prince
('LN23', 'M02', 'L02', 'POL1', '2026-03-05');   -- Tony Stark mượn lại


-- Thêm loan_detail - ưu tiên mượn B01 (Harry Potter 1) nhiều lần, dùng các bản sao khác nhau
INSERT INTO loan_detail (loan_id, book_copy_id, overdue_date, return_date, sum_of_fine) VALUES
('LN16', 'BC01', '2026-02-15', '2026-02-14', 0),
('LN17', 'BC21', '2026-02-17', NULL, 0),
('LN18', 'BC22', '2026-02-21', '2026-02-25', 20.0),
('LN19', 'BC23', '2026-02-26', '2026-02-24', 0),
('LN20', 'BC01', '2026-03-04', '2026-03-03', 0),
('LN21', 'BC21', '2026-03-08', '2026-03-15', 35.0),
('LN22', 'BC22', '2026-03-15', NULL, 0),
('LN23', 'BC23', '2026-03-19', '2026-03-18', 0),
('LN24', 'BC01', '2026-03-22', NULL, 0),
('LN25', 'BC21', '2026-03-24', '2026-03-22', 0);


-- (Tùy chọn) Thêm 1-2 loan nữa nếu muốn Harry Potter 1 vượt trội hẳn

INSERT INTO loan (loan_id, member_id, librarian_id, policy_id, loan_date) VALUES
('LN24', 'M13', 'L03', 'POL1', '2026-03-08'),   -- Arthur Curry
('LN25', 'M07', 'L01', 'POL1', '2026-03-10');   -- Steve Rogers

INSERT INTO loan_detail (loan_id, book_copy_id, overdue_date, return_date, sum_of_fine) VALUES
('LN24', 'BC01', '2026-03-22', NULL, 0),                  -- Arthur đang mượn
('LN25', 'BC21', '2026-03-24', '2026-03-22', 0);          -- Steve trả đúng
