WITH sm AS (SELECT me.pizza_name, pzr.id, pzr.name as pizzeria_name, me.price
			FROm menu me
			JOIN pizzeria pzr ON me.pizzeria_id = pzr.id)

SELECT s1.pizza_name, s2.pizzeria_name pizzeria_name_1, s1.pizzeria_name pizzeria_name_2, s1.price
FROm sm s1
JOIN sm s2 ON s1.price = s2.price AND s1.pizza_name = s2.pizza_name AND s1.id < s2.id
ORDER BY pizza_name;