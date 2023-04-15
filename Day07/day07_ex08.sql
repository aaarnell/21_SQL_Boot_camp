SELECT pe.address, pzr.name, COUNT(1) count_of_orders
FROM person_order po
JOIN menu me ON me.id = po.menu_id
JOIN pizzeria pzr ON me.pizzeria_id = pzr.id
JOIN person pe ON po.person_id = pe.id
GROUP BY pe.address, pzr.name
ORDER BY pe.address, pzr.name