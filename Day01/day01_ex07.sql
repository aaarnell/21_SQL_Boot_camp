SELECT order_date, CONCAT(Name, ' (age:', age, ')') AS person_information
FROM person_order AS po
JOIN person AS pe
	On po.person_id = pe.id
ORDER BY order_date, person_information