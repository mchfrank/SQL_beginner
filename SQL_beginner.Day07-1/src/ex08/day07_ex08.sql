SELECT p1.address AS address, p.name AS pizzeria_name, COUNT(*) AS count_of_orders
FROM person_order po
INNER JOIN menu m ON po.menu_id = m.id
INNER JOIN pizzeria p ON m.pizzeria_id = p.id
INNER JOIN person p1 ON p1.id = po.person_id
GROUP BY p1.address, p.name
ORDER BY p1.address, pizzeria_name;
