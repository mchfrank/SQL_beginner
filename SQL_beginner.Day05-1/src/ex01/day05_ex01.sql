-- SELECT menu.pizza_name, pizzeria.name AS pizzeria_name
-- FROM menu, pizzeria
-- WHERE menu.pizzeria_id = pizzeria.id;

SET enable_seqscan TO OFF;
EXPLAIN ANALYZE
SELECT menu.pizza_name, pizzeria.name AS pizzeria_name
FROM menu, pizzeria
WHERE menu.pizzeria_id = pizzeria.id;
