-- Задачи на join, использовать бд shop.

-- 1.Выведите имена покупателей, которые совершили покупку на сумму больше 1000 условных единиц.
-- В выборке должно присутствовать два атрибута — cname, amt.

use shop;
SELECT 
t1.cname, 
t2.amt
FROM customers t1
JOIN orders t2 ON t1.cust_id = t2.cust_id
WHERE t2.amt > 1000;

-- 2.Выведите имена покупателей, которые совершили покупку на сумму больше 1000 условных единиц.
-- В выборке должно присутствовать два атрибута — cname, amt. DUBLICATE dopolnim pokupki v gorode moskva ))

SELECT 
t1.cname, 
t2.amt,
t3.city
FROM customers t1
JOIN orders t2 ON t1.cust_id = t2.cust_id
JOIN sellers t3 ON t2.sell_id = t3.sell_id
WHERE t2.amt > 1000 
AND t3.city = 'Москва';
-- 3.Для каждого сотрудника выведите разницу между комиссионными его босса и его собственными. Если у сотрудника босса нет, выведите NULL.
-- Вывести : sname, difference.
SELECT 
t1.sname,
CASE 
WHEN t2.COMM is not null
THEN t2.COMM - t1.COMM
ELSE NULL
END as difference
FROM sellers t1
LEFT JOIN sellers t2 ON t1.boss_id = t2.sell_id;

-- 4.Выведите пары покупателей и обслуживших их продавцов из одного города.
-- Вывести: sname, cname, city

SELECT
 t1.sname, 
 t2.cname,
 t2.city
FROM sellers t1
JOIN customers t2 ON t1.city = t2.city;





