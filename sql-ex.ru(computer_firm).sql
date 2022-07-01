*/Краткая информация о базе данных "Компьютерная фирма":
Схема БД состоит из четырех таблиц:
Product(maker, model, type)
PC(code, model, speed, ram, hd, cd, price)
Laptop(code, model, speed, ram, hd, price, screen)
Printer(code, model, color, type, price)
Таблица Product представляет производителя (maker), номер модели (model) и тип ('PC' - ПК, 'Laptop' - ПК-блокнот или 'Printer' - принтер). 
Предполагается, что номера моделей в таблице Product уникальны для всех производителей и типов продуктов. В таблице PC для каждого ПК, однозначно
определяемого уникальным кодом – code, указаны модель – model (внешний ключ к таблице Product), скорость - speed (процессора в мегагерцах), объем памяти - ram (в мегабайтах), 
размер диска - hd (в гигабайтах), скорость считывающего устройства - cd (например, '4x') и цена - price (в долларах). 
Таблица Laptop аналогична таблице РС за исключением того, что вместо скорости CD содержит размер экрана -screen (в дюймах). 
В таблице Printer для каждой модели принтера указывается, является ли он цветным - color ('y', если цветной), тип принтера - type (лазерный – 'Laser', струйный – 'Jet' или матричный – 'Matrix') 
и цена - price.

--Задание: 1 
Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd

Select model, speed, hd from PC
where price <500;

--Задание: 2 
Найдите производителей принтеров. Вывести: maker

SELECT DISTINCT MAKER FROM PRODUCT WHERE TYPE = 'PRINTER';

--Задание: 3 
Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.

SELECT model, ram, screen from laptop where price >1000;
 
 --Задание: 4
Найдите все записи таблицы Printer для цветных принтеров.

Select * from Printer where color = 'y'


--Задание: 5 
Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.

Select model,speed,hd from PC where cd in ('12x','24x') and price <600


--Задание: 6
Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.

SELECT distinct Product.maker, Laptop.speed
FROM Product join Laptop on product.model = laptop.model 
WHERE Laptop.hd >= 10 and type = 'laptop'

--Задание: 7
Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).

Select laptop.model , laptop.price  from laptop inner join product on laptop.model = product.model  
where product.maker= 'B'
union 
Select PC.model , PC.price  from PC inner join product on PC.model = product.model  
where product.maker= 'B' 
union 
Select printer.model , printer.price  from printer inner join product on printer.model = product.model  
where product.maker= 'B'
 
--Задание: 8
Найдите производителя, выпускающего ПК, но не ПК-блокноты.

Select maker from product where type = 'PC' and maker not in (select maker from product where type = 'Laptop') group by maker


--Задание: 9 
Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker

Select maker from Product join PC on product.model= PC.model where speed >=450
group by maker

--Задание: 10 
Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price

Select model, price
From Printer 
Where price = (SELECT MAX(price) 
FROM Printer)

--Задание: 11 
Найдите среднюю скорость ПК.
 
select avg (speed) from PC 

--Задание: 12 
Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.
 
select avg(speed) from laptop where price >1000

--Задание: 13 
Найдите среднюю скорость ПК, выпущенных производителем A.

Select avg (speed) from PC inner join Product on PC.model = Product.model
where maker ='A'
 
--Задание: 15 
Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD

Select HD from PC group by HD having count(model)>1

--Задание: 17 (Serge I: 2003-02-03)
Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК.
Вывести: type, model, speed

Select distinct type, laptop.model, speed from Laptop inner join Product on Laptop.model=Product.model where speed <(select MIN(speed)from PC)

--Задание: 18 
Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price

SELECT DISTINCT maker,price from Printer inner join Product on Printer.model = Product.model where Price = (select MIN(price) from printer where color='y') and color='y'

--Задание: 19 
Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов.
Вывести: maker, средний размер экрана.

Select maker, avg(screen)as Avg_screen 
from Laptop join Product on laptop.model=product.model group by maker


--Задание: 20 
Найдите производителей, выпускающих по меньшей мере три различных модели ПК. Вывести: Maker, число моделей ПК.

select maker, count(model) as Count_model from product where type = 'PC' group by maker having count(model) >= 3

--Задание: 21
Найдите максимальную цену ПК, выпускаемых каждым производителем, у которого есть модели в таблице PC.
Вывести: maker, максимальная цена.

Select maker, MAX (price) as max_price from product inner join PC on product.model=PC.model group by maker

--Задание: 22 
Для каждого значения скорости ПК, превышающего 600 МГц, определите среднюю цену ПК с такой же скоростью. Вывести: speed, средняя цена.

select speed, avg(price) as avg_price from PC where speed >600 group by speed

--Задание: 23
Найдите производителей, которые производили бы как ПК
со скоростью не менее 750 МГц, так и ПК-блокноты со скоростью не менее 750 МГц.
Вывести: Maker

Select distinct maker from product inner join PC on product.model=PC.model
where pc.speed >=750 and maker in (select maker from laptop inner join product on laptop.model=product.model where laptop.speed>=750)

--Задание: 27 
Найдите средний размер диска ПК каждого из тех производителей, которые выпускают и принтеры. Вывести: maker, средний размер HD.
 
select maker, avg (HD) from product inner join pc on product.model=pc.model   
where maker in(select maker  from product  where type='printer')  group by maker

--Задание: 28 
Используя таблицу Product, определить количество производителей, выпускающих по одной модели.

select count (maker) from product where maker in(select maker from product group by maker having count(model)=1)
















