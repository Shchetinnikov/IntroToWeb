-- ВАРИАНТ-2

--------------- Задача-1 ---------------
select distinct e.job_id "JOB_ID", d.location_id "LOCATION_ID" 
from employees e
join departments d using(department_id)
where e.hire_date > to_date('01.01.1999', 'DD.MM.YYYY');
	

--------------- Задача-2 ---------------
select e.first_name "Имя", e.last_name "Фамилия", r.region_name "Регион" 
from employees e
join departments d using(department_id)
join locations l   using(location_id)
join countries c   using(country_id)
join regions r 	   using(region_id);
	

--------------- Задача-3 ---------------
select e1.last_name "Фамилия_Р", e1.hire_date "Дата_Р", 
	   e2.last_name "Фамилия_М", e2.hire_date "Дата_М" 
from employees e1 
join employees e2 on e1.manager_id = e2.employee_id
where e1.hire_date < e2.hire_date; 


--------------- Задача-4 ---------------
with a as
	(select avg(e.salary) avg_salary 
	from employees e)
select e.last_name "Фамилия_Р", e.first_name "Имя", e.salary "Оклад"
from employees e, a
where e.salary > a.avg_salary
order by e.salary;


--------------- Задача-5 ---------------
select e.last_name "Фамилия_Р", e.job_id "Ид_долж"
from employees e
join (select d.department_name, d.department_id
	  from   departments d 
	  where  d.department_name = 'Executive') d
using(department_id);