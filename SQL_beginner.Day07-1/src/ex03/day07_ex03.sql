WITH cte_visits AS (
        SELECT p.name, COUNT(*) AS visit_count
        FROM person_visits
        INNER JOIN pizzeria p ON person_visits.pizzeria_id = p.id
        GROUP BY p.name),
    cte_orders AS (
        SELECT p.name, COUNT(*) AS order_count
        FROM person_order
        INNER JOIN menu m ON person_order.menu_id = m.id
        INNER JOIN pizzeria p ON m.pizzeria_id = p.id
        GROUP BY p.name)
SELECT COALESCE(orders.name, visits.name) AS restaurant_name,
       COALESCE(order_count, 0) + COALESCE(visit_count, 0) AS total_count
FROM cte_orders orders
FULL JOIN cte_visits visits ON orders.name = visits.name
ORDER BY total_count DESC, restaurant_name;
