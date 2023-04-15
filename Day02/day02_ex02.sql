SELECT 
	COALESCE (pr.name, '-') AS person_name,
	pv.visit_date,
	COALESCE (pz.name, '-') AS pizzeria_name
FROM person AS pr
FULL JOIN 
	(SELECT *
	 FROM person_visits
	 WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') AS pv ON pr.id = pv.person_id
FULL JOIN pizzeria AS pz ON pv.pizzeria_id = pz.id
ORDER BY person_name, pv.visit_date, pizzeria_name