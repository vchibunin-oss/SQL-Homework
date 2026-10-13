-- 1. Имя контакта и город покупателей
SELECT contact_name, city
FROM public.customers;

-- 2. Идентификатор заказа и разница между датами заказа и отгрузки
SELECT
    order_id,
    shipped_date - order_date AS delivery_days
FROM public.orders;

-- 3. Уникальные города покупателей
SELECT DISTINCT city
FROM public.customers;

-- 4. Количество заказов
SELECT COUNT(*) AS total_orders
FROM public.orders;

-- 5. Количество стран, в которые отправлялись заказы
SELECT COUNT(DISTINCT ship_country) AS total_countries
FROM public.orders;