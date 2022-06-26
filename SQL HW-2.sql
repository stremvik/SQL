--Таблица employees
--Создать таблицу employees
--- id. serial,  primary key,
--- employee_name. Varchar(50), not null
create table employees(
id serial primary key,
employee_name varchar(50) not null 
);
select * from employees;
--Наполнить таблицу employee 70 строками
insert into employees (employee_name)
values ('Viktoria'),
('David'),
('Sara'),
('Stephan'),
('Yana'),
('Angela'),
('Svetlana'),
('Mario'),
('Alvadonna'),
('Penelopa'),
('Sintia'),
('Santiago'),
('Ruslan'),
('Yulia'),
('Inga'),
('Tomas'),
('Rebekka'),
('Klim'),
('Ivan'),
('Natalia'),
('Kate'),
('Nikolas'),
('Vadim'),
('Alex'),
('Rokky'),
('Lusia'),
('Manuchar'),
('Galina'),
('Lessy'),
('Julia'),
('Rachel'),
('Maja'),
('Rachel'),
('Robert'),
('Vitaly'),
('Alina'),
('Michael'),
('Alise'),
('Barbara'),
('Mark'),
('Valery'),
('Jonatan'),
('Salma'),
('Petr'),
('Vladimir'),
('Boris'),
('Sergio'),
('Olivia'),
('Penelopa'),
('Rolan'),
('Timur'),
('Patrik'),
('Rosa'),
('Ilona'),
('Damir'),
('Whilliam'),
('Kira'),
('Eric'),
('Steeven'),
('Timaty'),
('Queen'),
('Elisabeth'),
('Caroline'),
('Gabriella'),
('Ksenia'),
('Dmitry'),
('Inna'),
('Bogdan'),
('Elisey'),
('Susanna');
 
--проверка

select * from employees;


       
--Таблица salary
--Создать таблицу salary
--- id. Serial  primary key,
--- monthly_salary. Int, not null
create table salary(
id serial primary key,
monthly_salary int not null
);
--Наполнить таблицу salary 15 строками
insert into salary (monthly_salary)
values ('1100'),
('1200'),
('1300'),
('1400'),
('1500'),
('1600'),
('1700'),
('1800'),
('1900'),
('2000'),
('2100'),
('2200'),
('2300'),
('2400'),
('2500');
--проверка
select * from salary;
--Таблица employee_salary
--Создать таблицу employee_salary
---id. Serial  primary key,
---employee_id. Int, not null, unique
---salary_id. Int, not null
create table employee_salary(
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null
);
--Наполнить таблицу employee_salary 40 строками:
---в 10 строк из 40 вставить несуществующие employee_id
insert into employee_salary (employee_id, salary_id)
values (1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 22),
(23, 23),
(24, 24),
(25, 25),
(26, 26),
(27, 27),
(28, 28),
(29, 29),
(30, 30),
(71, 31),
(72, 32),
(73, 33),
(74, 34),
(75, 35),
(76, 36),
(77, 37),
(78, 38),
(79, 39),
(80, 40);
--проверка
select * from employee_salary;

--Создать таблицу roles
---id. Serial  primary key,
---role_name. int, not null, unique
create table roles(
id serial primary key,
role_name int not null unique
);
select * from roles;
--Поменять тип столба role_name с int на varchar(30)
alter table roles
alter column role_name
type varchar(30);
--Наполнить таблицу roles 20 строками
insert into roles(role_name)
values ('Junior Python developer'),
	   ('Middle Python developer'),
	   ('Senior Python developer'),
	   ('Junior Java developer'),
	   ('Middle Java developer'),   
	   ('Senior Java developer'),
	   ('Junior JavaScript developer'),
	   ('Middle JavaScript developer'),
	   ('Senior JavaScript developer'),
	   ('Junior Manual QA engineer'),
	   ('Middle Manual QA engineer'),
	   ('Senior Manual QA engineer'),
	   ('Project Manager'),
	   ('Designer'),
	   ('HR'),
	   ('CEO'),
	   ('Sales manager'),
	   ('Junior Automation QA engineer'),
	   ('Middle Automation QA engineer'),
	   ('Senior Automation QA engineer');
	  --проверка
	  select * from roles;
--Таблица roles_employee
--Создать таблицу roles_employee
---id. Serial  primary key,
---employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
---role_id. Int, not null (внешний ключ для таблицы roles, поле id)
	  create table roles_employee(
		id serial primary key,
		employee_id int not null unique,
		role_id int not null,
		foreign key (employee_id)
			references employees(id),
		foreign key (role_id)
			references roles(id)
);

--Наполнить таблицу roles_employee 40 строками
insert into roles_employee(employee_id,role_id)
values (5, 13),
       (1, 8),
       (38, 11),
       (42, 2),
       (25, 20),
       (59, 14),
       (29, 15),
       (18, 12),
       (24, 17),
       (32, 3),
       (47, 18),
       (56, 10),
       (57, 9),
       (44, 19),
       (51, 14),
       (19, 13),
       (12, 10),
       (28, 16),
       (16, 4),
       (11, 12),
       (13, 6),
       (23, 8),
       (52, 2),
       (14, 13),
       (33, 11),
       (15, 4),
       (46, 14),
       (41, 18),
       (60, 9),
       (65, 13),
       (9, 10),
       (2, 13),
       (3, 16),
       (8, 14),
       (17, 13),
       (4, 11),
       (27, 13),
       (34, 18),
       (20, 14),
       (30, 19);
    