SELECT
	COALESCE(person.name, '-') AS person_name,
	new_visits.visit_date,
	COALESCE(pizzeria.name, '-') AS pizzeria_name
FROM (
	SELECT visit_date::date
	FROM generate_series('2022-01-01', '2022-01-03', interval '1 day') AS visit_date
) AS new_visits
JOIN person_visits ON new_visits.visit_date = person_visits.visit_date
FULL JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
FULL JOIN person ON person.id = person_visits.person_id
ORDER BY person_name, visit_date, pizzeria_name;




