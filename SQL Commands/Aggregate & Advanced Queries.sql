
---Liệt kê tên sách, tên thành viên và tên thủ thư cho tất cả các lượt mượn sách thuộc thể loại 'Fantasy'.------------


select b.name_book, m.name, l.librarian_name
from librarian l 
join book b on l.librarian_id = b.librarian_id
join loan o on l.librarian_id = o.librarian_id
join member m on  o.member_id = m.member_id
join book_category bc on b.book_id = bc.book_id
join category c on bc.category_id = c.category_id
where c.category_name like N'Fantasy'


---Tính số tiền phạt trung bình trên mỗi cuốn sách bị trả muộn.

select b.name_book, AVG(ld.sum_of_fine) as N'số tiền phạt trung bình trên mỗi cuốn sách'
from book b
join book_copy bo on b.book_id = bo.book_id
join loan_detail ld on bo.book_copy_id = ld.book_copy_id
where ld.sum_of_fine not like '0' 
group by b.name_book




--- Tìm tên cuốn sách được mượn nhiều nhất (xuất hiện nhiều nhất trong bảng loan_detail).



select top 1 b.name_book , count(*) as N'số lần mượn sách'
from book b 
join book_copy bo on b.book_id = bo.book_id
join loan_detail ld on bo.book_copy_id = ld.book_copy_id
group by b.name_book
order by count(*) desc



----Hiển thị báo cáo gồm: ---------




select m.name, b.name_book, l.loan_date, ld.return_date, ld.sum_of_fine
from member m 
join loan l on m.member_id = l.member_id
join loan_detail ld on l.loan_id = ld.loan_id
join book_copy bo on ld.book_copy_id = bo.book_copy_id
join book b on bo.book_id = b.book_id



---5️⃣ Tìm tên các tác giả có sách thuộc thể loại 'Science' nhưng chưa có bản sao nào được mượn.



select a.author_name,c.category_name
from author a
join book_of_author ba on a.author_id = ba.author_id
join book b on ba.book_id = b.book_id
join book_category bc on b.book_id = bc.book_id
join category c on bc.category_id = c.category_id
join book_copy bo on b.book_id = bo.book_id
where c.category_name like 'Science'
and bo.book_copy_id not in (
select ld.book_copy_id from loan_detail ld
)





----6️⃣ Cho biết tổng số sách mượn theo từng địa chỉ của thành viên
---(Ví dụ: thành viên ở Gotham City đã mượn bao nhiêu cuốn sách).




select m.address, count(ld.book_copy_id) as N'tổng số sách mượn theo từng địa chỉ'
from member m
join loan l on m.member_id = l.member_id
join loan_detail ld on l.loan_id = ld.loan_id
group by m.address


