-- ВАРИАНТ-2

--------------- Задача-1 ---------------
select first_name || ' ' || last_name "ФИО", 
	   salary "ОКЛАД",
	   salary - round(salary * 0.13, 2) "Оклад минус подоходный"
from employees e;


--------------- Задача-2 ---------------
select first_name "Имя", 
	   last_name  "Фамилия",
	   job_id     "Должность",
	   to_char(hire_date, 'MM.DD.YYYY') "Дата приема на работу"
from employees e
where job_id in ('AD_PRES', 'AD_VP', 'AD_ASST') or extract(year from hire_date) between 1995 and 1999
limit 5;


--------------- Задача-3 ---------------
with h_experience as 
		(select jh.employee_id, 
				sum(extract(year from age(jh.end_date, jh.start_date))*12 +
					extract(month from age(jh.end_date, jh.start_date))*12) experience
		from     job_history jh
		group by jh.employee_id),
	c_experience as 
		(select e.employee_id, 
				extract(year from age(now(), e.hire_date))*12 +
				extract(month from age(now(), e.hire_date))*12 experience
		from employees e),
	t_experience as
		(select t.employee_id, sum(t.experience) experience
		from (select * from h_experience 
			  union
	          select * from c_experience) as t
        group by employee_id
        order by employee_id),
    employees_data as
		(select e1.employee_id, 
				e1.first_name, 
				e1.last_name,
--				e1.salary,
				e1.hire_date
		from employees e1)
select ed.first_name "Имя", 
	   ed.last_name  "Фамилия", 
--	   ed.salary     "Оклад", 
	   to_char(ed.hire_date  , 'MM.DD.YYYY') "Дата приема на работу",
	   te.experience "Проработано месяцев"
from employees_data ed join t_experience te using(employee_id);

/*
 * ЗАМЕЧЕНИЕ: 
 *    В общем случае, возможны ситуации, когда сотрудник занимает(ал) одновременно
 * несколько должностей. Тогда данные из job_history для каждого сотрудника
 * необходимо предварительно обработать (объединять начало и конец пересекающихся периодов).
 * Если абстрагироваться от интерпретации данных задачи, то для пересечений периодов
 * возможны разные вариации.
 *    Вообщем, решение задачи сводится к использованию конструкции <with recursive>.
 * В результате получается ответ от запроса, содержащий строки, которые были необходимы 
 * (объединенные пересекающиеся интервалы), и строки, являющиеся промежуточными результатами
 * и подлежащие удалению.
 *    Не знаю, как удалить лишние данные. Ниже приведен рекурсивный алгоритм по объединению интервалов.
 */

/* 
 * --1. В employees дата устройства на последнюю должность
 * --2. В job_history описаны промежутки для других должностей
 * --3. Они могут пересекаться
 * 
 * Алгоритм решения:
 * 1. Найти пересекающиеся периоды, объединить интервалы;
 * 2. Найти непересекающиеся периоды;
 * 3. Просуммировать опыт работы на каждом интервале для данного сотрудника.
 * 
 * В job_history первичный ключ составной: employee_id и start_date
 * Значит сотрудник не может быть устроен на несколько должностей в один день.
 */


--with recursive union_periods(employee_id, start_date, end_date) as
--		(-- Archor: поиск всех пар пересечений
--		 -- 		объединяем границы
--		select jh1.employee_id, 
-- 			    jh1.start_date, 
--			    jh2.end_date
--		from job_history jh1 
--		join job_history jh2 using(employee_id)
--		where jh1.start_date < jh2.start_date and jh1.end_date >= jh2.start_date
--		-- Находим пересечения для новых интервалов 
--		-- Условие остановки: нет новых пересечений
--		union all
--		(with subselect as 
--			(select *
--			 from union_periods)
--		select sb1.employee_id, 
-- 			   sb1.start_date, 
--			   sb2.end_date
--		from subselect sb1
--		join subselect sb2 using(employee_id)
--		where sb1.start_date < sb2.start_date and sb1.end_date >= sb2.start_date
--		except 
--		select *
--		from subselect))
--select * from union_periods;




--------------- Задача-4 ---------------
with jobs_data as
		(select j.job_id,
				j.max_salary,
				j.min_salary 
		from jobs j),
	avg_salaries as
		(select e.job_id, 
				avg(e.salary) avg_salary
		from employees e
		group by job_id)
select jd.job_id        "Должность",
	   jd.max_salary    "Максимальная зарплата",
	   jd.min_salary    "Минимальная зарплата",
	   avg_s.avg_salary "Средняя зарплата"
from jobs_data jd join avg_salaries avg_s using(job_id);