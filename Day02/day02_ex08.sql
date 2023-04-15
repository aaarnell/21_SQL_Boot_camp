SELECT DISTINCT pe.name
FROM person_order po
JOIN person pe ON po.person_id = pe.id
JOIN menu me ON me.id = po.menu_id
WHERE pe.gender = 'male' AND pe.address IN ('Moscow', 'Samara')
  AND me.pizza_name IN ('pepperoni pizza', 'mushroom pizza')
ORDER BY pe.name DESC;