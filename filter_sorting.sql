-- 1. Заказы, доставленные во Францию, Германию и Испанию
SELECT *
FROM public.orders
WHERE ship_country IN ('France', 'Germany', 'Spain');


-- 2. Уникальные страны и города доставки, отсортированные по стране и городу
SELECT DISTINCT ship_country, ship_city
FROM public.orders
ORDER BY ship_country, ship_city;


-- 3. Среднее количество дней доставки в Германию
SELECT AVG(shipped_date - order_date) AS average_delivery_days
FROM public.orders
WHERE ship_country = 'Germany';


-- 4. Минимальная и максимальная цена товаров, не снятых с продажи
SELECT
    MIN(unit_price) AS min_price,
    MAX(unit_price) AS max_price
FROM public.products
WHERE discontinued <> 1;


-- 5. Минимальная и максимальная цена товаров, которых осталось не меньше 20
SELECT
    MIN(unit_price) AS min_price,
    MAX(unit_price) AS max_price
FROM public.products
WHERE discontinued <> 1
  AND units_in_stock >= 20;