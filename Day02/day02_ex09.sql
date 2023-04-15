WITH pv AS (
		SELECT po.person_id, pe.name, me.pizza_name
		FROM person_order po
		JOIN menu me ON me.id = po.menu_id
		JOIN person pe ON pe.id = po.person_id
		WHERE pe.gender = 'female'
)

SELECT pp.name
FROM(SELECT person_id, name
		FROM pv
		WHERE pizza_name = 'pepperoni pizza') AS pp
INNER JOIN
(SELECT person_id, name
		FROM pv
		WHERE pizza_name = 'cheese pizza') AS cp
ON pp.person_id = cp.person_id
ORDER BY pp.name;

