----------------- Quản lý sách và tác giả ---------------

-- thông tin sách, tác giả của nhà sản xuất
create procedure InformationOfPublisher(
	@PublisherName Varchar(20)
)
as
if @PublisherName in (
	select publisher_name
	from publisher
)
begin
	select b.name_book, p.publisher_name, b.release
	from book as b
	join publisher as p on b.publisher_id=p.publisher_id
	where p.publisher_name like @PublisherName
end
else
begin
	print 'Not exist'
end

exec InformationOfPublisher 'Pearson'
drop procedure InformationOfPublisher




-- số sách tác giả đã viết
create procedure NumberOfBooks 
as
begin
	select a.author_name, count( ba.book_id) as TheNumberOfBook
	from author as a
	join book_of_author as ba on a.author_id=ba.author_id
	group by a.author_name
	order by TheNumberOfBook desc
end

exec NumberOfBooks
drop procedure NumberOfBooks



-- thông tin của sách thuộc thể loại
Create procedure InformationOfBookGenres (
	@Genre varchar(20)
)
as
if @Genre in (
	select category_name
	from category
)
begin
	select b.name_book,b.release,c.category_name
	from book as b
	join book_category as bc on b.book_id=bc.book_id
	join category as c on c.category_id=bc.category_id
	where c.category_name=@Genre
end
else
begin
	print 'Not exist'
end

exec InformationOfBookGenres 'Computing'




-- thông tin sách được viết bởi tác giả nào
create procedure InformationOfAuthor (
	@author_name varchar(30)
)
as 
if @author_name in (
	select author_name
	from author
)
begin 
	select a.author_name,b.name_book,b.release
	from author as a 
	join book_of_author as ba on ba.author_id=a.author_id
	join book as b on b.book_id=ba.book_id
	where a.author_name=@author_name
end
else
begin
	print 'Not exist'
end

exec InformationOfAuthor 'Robert Martin'
drop procedure InformationOfAuthor


-- Thông tin sách và tác giả từ năm N đến nay

create procedure GetBooksAndAuthorsFromYear (
	@year int
)
as
if @year <= year(GETDATE())
begin
	select b.name_book,a.author_name,b.release
	from book as b
	join book_of_author as ba on ba.book_id=b.book_id
	join author as a on a.author_id=ba.author_id
	where year(b.release) >= @year
end
else
begin
	print 'Time exceeds'
end

exec GetBooksAndAuthorsFromYear 2022
drop procedure GetBooksAndAuthorsFromYear




