SELECT me.pizza_name, piz.name AS pizzeria_name, price
FROM menu AS me
JOIN pizzeria as piz
	ON me.pizzeria_id = piz.id
WHERE me.pizza_name ='mushroom pizza' OR me.pizza_name = 'pepperoni pizza'
ORDER BY me.pizza_name, pizzeria_name;