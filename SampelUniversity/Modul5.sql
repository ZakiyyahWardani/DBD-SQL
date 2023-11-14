select concat_ws(' ',ID, name) as PROFIL
from student;

select substring_index(name, ' ', 1) as result
from student;

select substring(name, 1, 3) as result
from student;

select length(name) as length_of_name
from student;

select replace(title, 'sampel', 'contoh') as modified_title
from course;

select abs(salary) as absolute_salary
from instructor;

select ceiling(budget) as rounded_budget
from department;

select floor(salary) as rounded_salary
from instructor;

select round(budget, 2) as rounded_budget
from department;

select sqrt(salary) as square_root_salary
from instructor;

select curdate() as tanggal_sekarang; 

select curtime() as tanggal_sekarang; 

select timestamp('2023-11-07 12:30:00') as custom_timestamp;

select sum(credits) as total_credits
from course;

select avg(salary) as average_salary
from instructor;

select count(*) as total_students
from student;

select dept_name, count(*) as total_students
from student
group by dept_name 
having count(*) > 1;
