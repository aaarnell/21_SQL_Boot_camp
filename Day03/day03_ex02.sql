SELECT pizza_name, price, pzr.name pizzeria_name
FROM menu me
LEFT JOIN pizzeria pzr ON pzr.id = me.pizzeria_id
WHERE me.id IN (SELECT id
			FROM menu
			EXCEPT
			SELECT menu_id
			FROM person_order)
ORDER BY pizza_name, price;