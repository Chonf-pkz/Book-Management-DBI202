-- Số lượng sách theo từng nhà xuất bản
SELECT [p].[publisher_name], COUNT([b].[book_id]) AS [total_books]
FROM [dbo].[publisher] AS [p]
INNER JOIN [dbo].[book] AS [b] ON [p].[publisher_id] = [b].[publisher_id]
GROUP BY [p].[publisher_name];
GO

-- Tổng tiền phạt của từng thành viên
SELECT [m].[name], ISNULL(SUM([ld].[sum_of_fine]), 0) AS [total_fine_amount]
FROM [dbo].[member] AS [m]
INNER JOIN [dbo].[loan] AS [l] ON [m].[member_id] = [l].[member_id]
INNER JOIN [dbo].[loan_detail] AS [ld] ON [l].[loan_id] = [ld].[loan_id]
GROUP BY [m].[member_id], [m].[name];
GO

-- Số lượng bản sao sách theo từng thể loại
SELECT [c].[category_name], COUNT([bcop].[book_copy_id]) AS [total_copies]
FROM [dbo].[category] AS [c]
INNER JOIN [dbo].[book_category] AS [bc] ON [c].[category_id] = [bc].[category_id]
INNER JOIN [dbo].[book_copy] AS [bcop] ON [bc].[book_id] = [bcop].[book_id]
GROUP BY [c].[category_name];
GO

-- Số lượt mượn của từng cuốn sách
SELECT [b].[name_book], COUNT([ld].[loan_id]) AS [times_borrowed]
FROM [dbo].[book] AS [b]
INNER JOIN [dbo].[book_copy] AS [bc] ON [b].[book_id] = [bc].[book_id]
INNER JOIN [dbo].[loan_detail] AS [ld] ON [bc].[book_copy_id] = [ld].[book_copy_id]
GROUP BY [b].[book_id], [b].[name_book];
GO

-- Số lượng sách do mỗi thủ thư quản lý
SELECT [lib].[librarian_name], COUNT([b].[book_id]) AS [managed_books]
FROM [dbo].[librarian] AS [lib]
INNER JOIN [dbo].[book] AS [b] ON [lib].[librarian_id] = [b].[librarian_id]
GROUP BY [lib].[librarian_id], [lib].[librarian_name];
GO
