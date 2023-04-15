WITH fem(pizzeria_name) AS(
  		SELECT pzr.name
		FROM person_visits pv
		JOIN pizzeria pzr ON pzr.id = pv.pizzeria_id
		JOIN person pe ON pe.id = pv.person_id
  		WHERE pe.gender = 'female'
), mal(pizzeria_name) AS(
  		SELECT pzr.name
		FROM person_visits pv
		JOIN pizzeria pzr ON pzr.id = pv.pizzeria_id
		JOIN person pe ON pe.id = pv.person_id
  		WHERE pe.gender = 'male'
)

(SELECT pizzeria_name FROM fem
EXCEPT ALL
SELECT pizzeria_name FROM mal)
UNION ALL
(SELECT pizzeria_name FROM mal
EXCEPT ALL
SELECT pizzeria_name FROM fem)
ORDER BY pizzeria_name;