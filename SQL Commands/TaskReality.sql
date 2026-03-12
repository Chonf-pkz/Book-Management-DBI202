--- 01 Tính tổng số tiền phạt (sum_of_fine) mà thư viện nhận được từ đơn mượn 'LN03' và 'LN05'.

-- gom cả 2 đơn
select sum(sum_of_fine) as total_fine
from loan_detail
where loan_id in ('LN03', 'LN05');

-- từng thằng riêng biệt
select loan_id, sum(sum_of_fine) as total_fine
from loan_detail
where loan_id in ('LN03', 'LN05')
group by loan_id;


--- 02 Liệt kê các đơn mượn có phát sinh tiền phạt (sum_of_fine > 0), hiển thị kèm tên thành viên và số tiền.
--Cho biết mức phạt (fine_amount) và thời hạn mượn tối đa của chính sách do Admin 'Nick Fury' (ADM1) tạo ra.
select 
    l.loan_id, 
    m.name as member_name, 
    sum(ld.sum_of_fine) as total_fine, 
    p.fine_amount, 
    p.maximum_loan_period
from loan l
join member m on l.member_id = m.member_id
join loan_detail ld on l.loan_id = ld.loan_id
join policy_rule p on l.policy_id = p.policy_id
join administrator a on p.admin_id = a.admin_id
where a.admin_id = 'ADM1'
group by 
    l.loan_id, 
    m.name, 
    p.fine_amount, 
    p.maximum_loan_period
having sum(ld.sum_of_fine) > 0;


--- 03 Tính số ngày trả muộn của các bản sao đã trả (Dùng DATEDIFF giữa return_date và overdue_date).
-- Chỉ lấy những trường hợp thực sự đã trả muộn hơn hạn
select 
    loan_id, 
    book_copy_id, 
    overdue_date, 
    return_date, 
    datediff(day, overdue_date, return_date) as late_days
from loan_detail
where return_date is not null 
  and overdue_date < return_date; 
 
  



 --- 04 Tìm tên thành viên và tổng số tiền phạt họ phải trả (Chỉ lấy những người có tổng phạt > 0).
select 
    m.member_id,
    m.name as member_name, 
    sum(ld.sum_of_fine) as total_fine_to_pay
from member m
join loan l on m.member_id = l.member_id
join loan_detail ld on l.loan_id = ld.loan_id
group by m.member_id, m.name
having sum(ld.sum_of_fine) > 0;





--- 05 Cho biết chính sách nào (policy_id) đang được áp dụng cho nhiều đơn mượn nhất.
select top 1 
    policy_id, 
    count(loan_id) as total_loans
from loan
group by policy_id
order by total_loans desc;

