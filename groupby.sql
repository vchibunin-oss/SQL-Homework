-- 1. Города, заканчивающиеся на burg
SELECT DISTINCT ship_city, ship_country
FROM public.orders
WHERE ship_city LIKE '%burg';

-- 2. Первые 10 заказов в странах на P
SELECT order_id, customer_id, freight, ship_country
FROM public.orders
WHERE ship_country LIKE 'P%'
ORDER BY freight DESC
LIMIT 10;

-- 3. Сотрудники без указанного региона
SELECT first_name, last_name, home_phone
FROM public.employees
WHERE region IS NULL;

-- 4. Количество поставщиков по странам
SELECT country, COUNT(*) AS supplier_count
FROM public.suppliers
GROUP BY country
ORDER BY supplier_count DESC;

-- 5. Общая стоимость доставки по странам
SELECT ship_country, SUM(freight) AS total_freight
FROM public.orders
WHERE ship_region IS NOT NULL
GROUP BY ship_country
HAVING SUM(freight) > 2750
ORDER BY total_freight DESC;

-- 6. Страны, общие для покупателей, поставщиков и сотрудников
SELECT country FROM public.customers
INTERSECT
SELECT country FROM public.suppliers
INTERSECT
SELECT country FROM public.employees;

-- 7. Страны, где есть покупатели и поставщики, но нет сотрудников
SELECT country FROM public.customers
INTERSECT
SELECT country FROM public.suppliers
EXCEPT
SELECT country FROM public.employees;