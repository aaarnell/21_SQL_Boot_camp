WITH gen_date AS (SELECT generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day') AS missing_date)

SELECT to_char(missing_date, 'YYYY-MM-DD') missing_date
FROM (SELECT DISTINCT visit_date
		FROM person_visits
		WHERE person_id = 1 OR person_id = 2) pv
RIGHT JOIN  gen_date md
      ON pv.visit_date = md.missing_date
WHERE pv.visit_date IS NULL
ORDER By missing_date ASC;