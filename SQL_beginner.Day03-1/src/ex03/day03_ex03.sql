WITH pizzeria_visits AS (
    SELECT
        pv.pizzeria_id,
        p.name AS pizzeria_name,
        COUNT(*) AS visit_count,
        pe.gender
    FROM
        person_visits pv
    JOIN
        pizzeria p ON pv.pizzeria_id = p.id
    JOIN
        person pe ON pv.person_id = pe.id
    GROUP BY
        pv.pizzeria_id, p.name, pe.gender)
SELECT pizzeria_name
FROM (
    SELECT
        pizzeria_name,
        MAX(CASE WHEN gender = 'female' THEN visit_count ELSE 0 END) AS female_visits,
        MAX(CASE WHEN gender = 'male' THEN visit_count ELSE 0 END) AS male_visits
    FROM
        pizzeria_visits
    GROUP BY
        pizzeria_name) AS gender_visits
WHERE female_visits > male_visits
UNION ALL
SELECT pizzeria_name
FROM (
    SELECT
        pizzeria_name,
        MAX(CASE WHEN gender = 'female' THEN visit_count ELSE 0 END) AS female_visits,
        MAX(CASE WHEN gender = 'male' THEN visit_count ELSE 0 END) AS male_visits
    FROM
        pizzeria_visits
    GROUP BY
        pizzeria_name) AS gender_visits
WHERE male_visits > female_visits
ORDER BY pizzeria_name;
