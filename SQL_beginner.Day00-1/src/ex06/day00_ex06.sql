SELECT
    (SELECT name
     FROM person
     WHERE person_order.person_id = person.id
    ) AS person_name,
    CASE
        WHEN
            (SELECT name
             FROM person
             WHERE person_order.person_id = person.id
            ) = 'Denis' THEN TRUE
        ELSE FALSE
    END AS check_name
FROM person_order
WHERE person_order.menu_id IN (13, 14, 18)
  AND person_order.order_date = '2022-01-07';
