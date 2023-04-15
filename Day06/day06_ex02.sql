SELECT pe.name, 
	me.pizza_name, 
	me.price, 
	price - ((me.price / 100) * pd.discount)::numeric(7,2) AS discount_price, 
	pzr.name AS pizzeria_name
FROM person_order po
JOIN menu me ON po.menu_id = me.id
JOIN person_discounts pd ON pd.person_id = po.person_id AND pd.pizzeria_id = me.pizzeria_id
JOIN person pe ON po.person_id = pe.id
JOIN pizzeria pzr ON me.pizzeria_id = pzr.id
ORDER BY pe.name, me.pizza_name