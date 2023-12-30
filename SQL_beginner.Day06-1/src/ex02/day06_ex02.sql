SELECT
    p.name,
    m.pizza_name,
    m.price,
    (m.price - (m.price * pd.discount/100)) AS discount_price,
    p2.name AS pizzeria_name
FROM
    person_order
INNER JOIN menu m ON m.id = person_order.menu_id
INNER JOIN person p ON p.id = person_order.person_id
INNER JOIN person_discounts pd ON p.id = pd.person_id AND m.pizzeria_id = pd.pizzeria_id
INNER JOIN pizzeria p2 ON m.pizzeria_id = p2.id
ORDER BY name, pizza_name;
