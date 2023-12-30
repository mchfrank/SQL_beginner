SELECT menu.pizza_name, menu.price, pizzeria.name AS pizzeria_name, person_visits.visit_date
FROM person p
JOIN person_visits ON p.id = person_visits.person_id
JOIN menu ON person_visits.pizzeria_id = menu.pizzeria_id -- Corrected column reference
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE p.name = 'Kate' AND menu.price BETWEEN 800 AND 1000
ORDER BY menu.pizza_name, menu.price, pizzeria.name;
