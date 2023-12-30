CREATE VIEW v_price_with_discount AS
SELECT name, pizza_name, price, ROUND(price * 0.9) AS discount_price
FROM person_order po
JOIN person p ON po.person_id = p.id
JOIN menu m ON po.menu_id = m.id
ORDER BY name, pizza_name;

select *
from v_price_with_discount