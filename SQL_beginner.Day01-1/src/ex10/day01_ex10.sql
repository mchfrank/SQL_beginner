SELECT person.name AS person_name, menu.pizza_name AS pizza_name, pizzeria.name AS pizzeria_name
FROM pizzeria
JOIN menu ON menu.pizzeria_id = pizzeria.id
JOIN person_order on menu.id = person_order.menu_id
JOIN person on person_order.person_id = person.id
ORDER BY person_name, pizza_name, pizzeria_name;