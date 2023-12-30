CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT DISTINCT pizzeria.name AS pizzeria_name
FROM person p
JOIN person_visits pv ON p.id = pv.person_id
JOIN pizzeria ON pv.pizzeria_id = pizzeria.id
JOIN menu ON pizzeria.id = menu.pizzeria_id
WHERE p.name = 'Dmitriy'
    AND pv.visit_date = '2022-01-08'
    AND menu.price <= 800;

-- SELECT *
-- FROM mv_dmitriy_visits_and_eats;