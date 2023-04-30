-- ВАРИАНТ-2

--------------- Задача-1 ---------------
select * from bd_employees be
where be.phone_number ~* '^8-\((495|499)\)-\d{3}-\d{2}-\d{2}$';


--------------- Задача-2 ---------------
select be.last_name, bd.street, bd.postal_code
from bd_employees be
join bd_departments bd on be.department_id=bd.id
where be.last_name ~ '^[A-Z][a-z]+$';


--------------- Задача-3 ---------------
select be.last_name, regexp_replace(be.email, '(.{2}).*(@.+)', '\1_\2')
from bd_employees be;


--------------- Задача-4 ---------------
-- Предобработка строк
     -- Удаление всех символов, кроме букв.
with prep as 	  
		(select *, regexp_replace(be.first_name, '[^[:alpha:]]', '', 'ig') fname1
		from bd_employees be),
     -- Удаление всех согласных.
	 employees as 
		(select *, regexp_replace(prep.fname1, '[BCDFGHJKLMNPQRSTVWXYZ]', '', 'ig') fname2
		from prep)
select e.last_name, e.first_name, e.phone_number, e.email, e.department_id
from employees e
where length(e.fname2) <= 3;