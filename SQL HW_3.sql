--1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.

select employees.employee_name, salary.monthly_salary 
from employees join salary on employees.id = salary.id;

--2. Вывести всех работников у которых ЗП меньше 2000.
select employees.employee_name, salary.monthly_salary 
from employees join salary on employees.id = salary.id
where salary.monthly_salary < 2000;

--3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select salary.monthly_salary
from salary left join employees on salary.id = employees.id
where salary.id  = null;

--4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select salary.monthly_salary
from salary left join employees on salary.id = employees.id
where salary.id <2000 and employee_name is null;

-- 5. Найти всех работников кому не начислена ЗП.
 select employee_name as "имя работника без зарплаты",
 monthly_salary as "ЗП отсутствует"
 from salary join employee_salary 
 on salary.id = employee_salary.employee_id
 right join employees on employee_salary.employee_id = employees.id
 where monthly_salary is null;

 --6. Вывести всех работников с названиями их должности.
 select employee_name as "имя работника",
 role_name as "название должности"
 from roles_employee join employees 
 on roles_employee.employee_id = employees.id
 join roles on roles_employee.role_id = roles.id;

--7. Вывести имена и должность только Java разработчиков.
 select employee_name as "имя работника",
 role_name as "название должности"
 from roles_employee join employees 
 on roles_employee.employee_id = employees.id
 join roles on roles_employee.role_id = roles.id
 where role_name like '%Java%';

--8. Вывести имена и должность только Python разработчиков.
select employee_name as "имя разработчика",
role_name as "должность"
from employees join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where role_name like '%Python%';

--9. Вывести имена и должность всех QA инженеров.
select employee_name as "имя разработчика",
role_name as "должность"
from employees join roles_employee 
on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id 
where role_name like '%QA%';

--10. Вывести имена и должность ручных QA инженеров.
select employee_name as "имя разработчика",
role_name as "должность"
from employees join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id 
where role_name like '%Manual QA engineer%';

--11. Вывести имена и должность автоматизаторов QA
select employee_name as "имя разработчика",
role_name as "должность"
from employees join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id 
where role_name like '%Automation QA%';

 --12. Вывести имена и зарплаты Junior специалистов
select employees.employee_name as "имя работника",
roles.role_name as "Junior",
salary.monthly_salary as "зарплата"
from employees 
join employee_salary on employees.id = employee_salary.employee_id 
join salary on employee_salary.salary_id = salary.id 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id  
where role_name like '%Junior%';

 --13. Вывести имена и зарплаты Middle специалистов  
select employees.employee_name as "имя работника",
roles.role_name as "Middle",
salary.monthly_salary as "зарплата"
from employees 
join employee_salary on employees.id = employee_salary.employee_id 
join salary on employee_salary.salary_id = salary.id 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id  
where role_name like '%Middle%'; 

--14. Вывести имена и зарплаты Senior специалистов 
select employees.employee_name as "имя работника",
roles.role_name as "Senior",
salary.monthly_salary as "зарплата"
from employees 
join employee_salary on employees.id = employee_salary.employee_id 
join salary on employee_salary.salary_id = salary.id 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id  
where role_name like '%Senior%';

--15. Вывести зарплаты Java разработчиков
select salary.monthly_salary as "зарплата Java"
from employees 
join employee_salary on employees.id = employee_salary.employee_id 
join salary on employee_salary.salary_id = salary.id 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id  
where role_name like '%Java%';

--16. Вывести зарплаты Python разработчиков
select salary.monthly_salary as "зарплата Python"
from employees 
left join employee_salary on employees.id = employee_salary.employee_id 
left join salary on employee_salary.salary_id = salary.id 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id  
where role_name like '%Python%';

--17. Вывести имена и зарплаты Junior Python разработчиков    
select employees.employee_name as "имя работника",
roles.role_name as "Junior Python",
salary.monthly_salary as "зарплата"
from employees 
join employee_salary on employees.id = employee_salary.employee_id 
join salary on employee_salary.salary_id = salary.id 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id  
where role_name like '%Junior Python%';

--18. Вывести имена и зарплаты Middle JS разработчиков   
select employees.employee_name as "имя работника",
roles.role_name as "Middle JavaScript developer",
salary.monthly_salary as "зарплата"
from employees 
join employee_salary on employees.id = employee_salary.employee_id
join salary on employee_salary.salary_id = salary.id
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id  
where role_name like '%Middle JavaScript developer%';

 --19. Вывести имена и зарплаты Senior Java разработчиков 
select employees.employee_name as "имя работника",
roles.role_name as "Senior Java",
salary.monthly_salary as "зарплата"
from employees 
join employee_salary on employees.id = employee_salary.employee_id 
join salary on employee_salary.salary_id = salary.id 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id  
where role_name like '%Senior Java%';

--20. Вывести зарплаты Junior QA инженеров
select salary.monthly_salary as "зарплата Junior QA"
from employees 
join employee_salary on employees.id = employee_salary.employee_id 
join salary on employee_salary.salary_id = salary.id 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id  
where role_name like '%Junior Manual QA engineer%';

--21. Вывести среднюю зарплату всех Junior специалистов
select avg(monthly_salary) as "средняя зарплата Junior"
from employees 
join employee_salary on employees.id = employee_salary.employee_id 
join salary on employee_salary.salary_id = salary.id 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id  
where role_name like '%Junior%';

--22. Вывести сумму зарплат JS разработчиков
select sum(monthly_salary) as "сумму зарплат JS"
from employees 
join employee_salary on employees.id = employee_salary.employee_id 
join salary on employee_salary.salary_id = salary.id 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id  
where role_name like '%JavaScript%';

--23. Вывести минимальную ЗП QA инженеров
select min (monthly_salary) as "мin ЗП QA инженеров"
from employees 
join employee_salary on employees.id = employee_salary.employee_id 
join salary on employee_salary.salary_id = salary.id 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id  
where role_name like '%QA engineer%';

--24. Вывести максимальную ЗП QA инженеров
select max (monthly_salary) as "max ЗП QA инженеров"
from employees 
join employee_salary on employees.id = employee_salary.employee_id 
join salary on employee_salary.salary_id = salary.id 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id  
where role_name like '%QA engineer%';
      
 --25. Вывести количество QA инженеров
select count (employees) as "количество QA инженеров"
from employees 
join employee_salary on employees.id = employee_salary.employee_id 
join salary on employee_salary.salary_id = salary.id 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id  
where role_name like '%QA engineer%';
--26. Вывести количество Middle специалистов.
select count (employees) as "количество Middle"
from employees 
join employee_salary on employees.id = employee_salary.employee_id 
join salary on employee_salary.salary_id = salary.id 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id  
where role_name like '%Middle%';

--27. Вывести количество разработчиков
select count (employees) as "количество разработчиков"
from employees 
join employee_salary on employees.id = employee_salary.employee_id 
join salary on employee_salary.salary_id = salary.id 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id  
where role_name like '%developer%';
      
 --28. Вывести фонд (сумму) зарплаты разработчиков.
select sum(monthly_salary) as "суммa зарплат dev"
from employees 
join employee_salary on employees.id = employee_salary.employee_id 
join salary on employee_salary.salary_id = salary.id 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id  
where role_name like '%developer%';

--29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select employee_name, role_name, monthly_salary
from employees 
left join employee_salary on employees.id = employee_salary.employee_id 
left join salary on employee_salary.salary_id = salary.id 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id 
order by monthly_salary ASC;

--30. --Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300 
select employee_name, role_name, monthly_salary
from employees 
left join employee_salary on employees.id = employee_salary.employee_id 
left join salary on employee_salary.salary_id = salary.id 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id 
where monthly_salary between 1700 and 2300;
order by monthly_salary asc;
       
--31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select employee_name, role_name, monthly_salary
from employees 
left join employee_salary on employees.id = employee_salary.employee_id 
left join salary on employee_salary.salary_id = salary.id      
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id 
where monthly_salary < 2300;
order by monthly_salary asc;

 --32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select employee_name, role_name, monthly_salary
from employees 
left join employee_salary on employees.id = employee_salary.employee_id 
left join salary on employee_salary.salary_id = salary.id 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id 
where monthly_salary in  (1100, 1500,2000)      
order by monthly_salary asc;  
      
      
      
      
      

      
 