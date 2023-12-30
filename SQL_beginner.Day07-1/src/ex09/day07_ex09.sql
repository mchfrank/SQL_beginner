WITH AgeInfo AS (
    SELECT address, ROUND(MAX(age::numeric) - (MIN(age::numeric) / MAX(age::numeric)), 2) AS formula,
           ROUND(AVG(age::numeric), 2) AS average
    FROM person
    GROUP BY address)
SELECT address, formula, average, formula > average AS comparison
FROM AgeInfo
ORDER BY address;
