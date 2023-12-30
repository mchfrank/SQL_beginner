CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS TABLE(number1 BIGINT) AS $$
WITH RECURSIVE f (number1, number2) AS
(SELECT 0 AS number1, 1 AS number2
UNION ALL
SELECT number2, number1 + number2 FROM f WHERE number2 < pstop)
SELECT number1
FROM f;
$$ LANGUAGE SQL;

-- DROP FUNCTION IF EXISTS fnc_fibonacci(integer);
select * from fnc_fibonacci(20);
SELECT * FROM fnc_fibonacci(100);
SELECT * FROM fnc_fibonacci();
