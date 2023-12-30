SELECT missing_days.missing_day::date AS missing_day
FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS missing_days(missing_day)
LEFT JOIN (
    SELECT DISTINCT visit_date
    FROM person_visits
    WHERE person_id IN (1, 2)
) AS visited_days ON missing_days.missing_day = visited_days.visit_date
WHERE visited_days.visit_date IS NULL
ORDER BY missing_days.missing_day;
