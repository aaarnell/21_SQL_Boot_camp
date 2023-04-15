SELECT order_date AS action_date, pe.name AS person_name
FROM person_order AS po
JOIN person AS pe
	On po.person_id = pe.id
INTERSECT
SELECT visit_date AS action_date, pe.name AS person_name
FROM person_visits AS pv
JOIN person AS pe
	On pv.person_id = pe.id
ORDER BY action_date ASC, person_name DESC