INSERT INTO person_visits
VALUES (
    COALESCE((SELECT MAX(id) + 1 FROM person_visits), 1),
    (SELECT id FROM person WHERE name = 'Dmitriy'),
    (
        SELECT COALESCE(
            (SELECT pizzeria.id
             FROM pizzeria
             JOIN menu ON price < 800 AND pizzeria.id = pizzeria_id
             WHERE pizzeria.name = 'DinoPizza'
             LIMIT 1), 1
        )
    ),
'2022-01-08');
REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;

SELECT *
FROM mv_dmitriy_visits_and_eats;
