SELECT pzr.name
FROM menu AS me
INNER JOIN person_visits as pv ON me.pizzeria_id = pv.pizzeria_id
INNER JOIN person AS pe ON pv.person_id = pe.id
JOIN pizzeria AS pzr
	ON pzr.id = me.pizzeria_id
WHERE me.price < 800 AND pv.visit_date = '2022-01-08' AND pe.name = 'Dmitriy';
