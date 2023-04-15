SELECT me.pizza_name, me.price, pz.name AS pizzeria_name, pv.visit_date
FROM menu AS me
JOIN pizzeria AS pz ON me.pizzeria_id = pz.id
JOIN person_visits AS pv ON pz.id = pv.pizzeria_id
JOIN person AS pr ON pv.person_id = pr.id
WHERE pr.name = 'Kate' AND me.price BETWEEN 800 AND 1000
ORDER BY me.pizza_name, me.price, pz.name