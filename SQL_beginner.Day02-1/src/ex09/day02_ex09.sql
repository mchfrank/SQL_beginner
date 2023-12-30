SELECT
    person.name
FROM
    person
WHERE
    gender = 'female'
    AND EXISTS (
        SELECT 1
        FROM person_order
        JOIN menu ON menu.id = person_order.menu_id
        WHERE person_order.person_id = person.id
          AND pizza_name IN ('pepperoni pizza', 'cheese pizza')
        GROUP BY person_order.person_id
        HAVING COUNT(DISTINCT pizza_name) = 2
    )
