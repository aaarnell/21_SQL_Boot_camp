SELECT DISTINCT(pva.pizzeria_name)
FROM
	(SELECT pv.pizzeria_id, pz.name AS pizzeria_name
	FROM person_visits AS pv
	LEFT JOIN person AS pr ON pv.person_id = pr.id
	LEFT JOIN pizzeria AS pz ON pv.pizzeria_id = pz.id
	WHERE pr.name = 'Andrey') AS pva
LEFT JOIN 
	(SELECT me.pizzeria_id
	FROM person_order AS po
	LEFT JOIN person AS pr ON po.person_id = pr.id
	LEFT JOIN menu AS me ON po.menu_id = me.id
	WHERE pr.name = 'Andrey') AS poa ON pva.pizzeria_id = poa.pizzeria_id
WHERE poa.pizzeria_id IS NULL
ORDER BY pva.pizzeria_name;