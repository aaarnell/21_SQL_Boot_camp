SELECT me.pizza_name, pzr.name pizzeria_name
FROm person_order po
JOIN person pr On po.person_id = pr.id
JOIN menu me ON me.id = po.menu_id
JOIN pizzeria pzr ON me.pizzeria_id = pzr.id 
WHERE pr.name IN ('Denis', 'Anna')
ORDER BY me.pizza_name, pzr.name;