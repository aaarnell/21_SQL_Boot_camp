SELECT res.*
FROM
	((SELECT pz.name, COUNT(*), 'visit' AS action_type
	FROM person_visits AS pv
	LEFT JOIN pizzeria AS pz ON pv.pizzeria_id = pz.id
	GROUP BY pv.pizzeria_id, pz.name
	ORDER BY count DESC
	LIMIT 3)
	UNION ALL
	(SELECT pz.name, COUNT(*), 'order' AS action_type
	FROM person_order AS po
	LEFT JOIN menu AS me ON po.menu_id = me.id
	LEFT JOIN pizzeria AS pz ON me.pizzeria_id = pz.id
	GROUP BY me.pizzeria_id, pz.name
	ORDER BY count DESC
	LIMIT 3)) AS res
ORDER BY res.action_type, res.count DESC
