INSERT INTO person_discounts
SELECT ROW_NUMBER() OVER() AS id,
	po.person_id, 
	me.pizzeria_id, 
	CASE
		WHEN COUNT(*) = 1 THEN 10.5
		WHEN COUNT(*) = 2 THEN 22
		ELSE 30
	END AS discount
FROM person_order AS po
LEFT JOIN menu AS me ON po.menu_id = me.id
GROUP BY(po.person_id, me.pizzeria_id)