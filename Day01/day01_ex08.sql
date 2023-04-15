SELECT order_date, person_information
FROM person_order AS po
NATURAL JOIN 
	(SELECT ID AS person_id, 
     	CONCAT(name, ' (age:', age, ')') AS person_information 
     FROM person) AS pe
ORDER BY order_date, person_information