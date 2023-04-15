SELECT pz.name, 
	COUNT(*) AS cpunt_of_orders,
	ROUND(AVG(me.price),2) AS average_price,
	MAX(me.price) AS max_price,
	MIN(me.price) AS min_price
FROM person_order AS po
LEFT JOIN menu AS me ON po.menu_id = me.id
LEFT JOIN pizzeria AS pz ON me.pizzeria_id = pz.id
GROUP BY pz.id, pz.name
ORDER BY pz.name