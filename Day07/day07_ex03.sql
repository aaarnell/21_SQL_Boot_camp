SELECT res.name, COUNT(*) AS total_count
FROM
	(SELECT pv.pizzeria_id, pz.name
	FROM person_visits AS pv
	LEFT JOIN pizzeria AS pz ON pv.pizzeria_id = pz.id
	UNION ALL
	SELECT me.pizzeria_id, pz.name
	FROM person_order AS po
	LEFT JOIN menu AS me ON po.menu_id = me.id
	LEFT JOIN pizzeria AS pz ON me.pizzeria_id = pz.id) AS res
GROUP BY res.pizzeria_id, res.name
ORDER BY total_count DESC