SELECT name
FROM pizzeria
WHERE id IN (
    SELECT pizzeria_id
    FROM person_visits
    JOIN person ON person.id = person_id
    WHERE name = 'Andrey'
    EXCEPT
    SELECT pizzeria_id
    FROM menu
    JOIN person_order ON menu_id = menu.id
    JOIN person ON person.id = person_id
    WHERE name = 'Andrey');