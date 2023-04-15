SELECT pe.name AS person_name, me.pizza_name, piz.name AS pizzeria_name
FROM person_order as po
JOIN person AS pe
	ON po.person_id = pe.id
JOIN menu AS me
	ON me.id = po.menu_id
JOIN pizzeria as piz
	ON me.pizzeria_id = piz.id
ORDER BY  person_name, me.pizza_name, pizzeria_name