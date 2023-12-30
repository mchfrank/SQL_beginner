INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT
    (SELECT MAX(id) FROM person_order) + (p.id - (SELECT MIN(id) FROM person)) + 1 AS id,
    p.id AS person_id,
    m.id AS menu_id,
    '2022-02-25'::date AS order_date
FROM person p
JOIN menu m ON m.pizza_name = 'greek pizza';

