WITH fem(pizzeria_name) AS(
  		SELECT pzr.name
		FROM person_order po
  		JOIN menu me On me.id = po.menu_id
		JOIN pizzeria pzr ON pzr.id = me.pizzeria_id
		JOIN person pe ON pe.id = po.person_id
  		WHERE pe.gender = 'female'
), mal(pizzeria_name) AS(
  		SELECT pzr.name
		FROM person_order po
  		JOIN menu me On me.id = po.menu_id
		JOIN pizzeria pzr ON pzr.id = me.pizzeria_id
		JOIN person pe ON pe.id = po.person_id
  		WHERE pe.gender = 'male'
)

(SELECT pizzeria_name FROM fem
EXCEPT
SELECT pizzeria_name FROM mal)
UNION
(SELECT pizzeria_name FROM mal
EXCEPT
SELECT pizzeria_name FROM fem)
ORDER BY pizzeria_name;