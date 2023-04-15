SELECT pz.name AS pizzeria_name
FROM pizzeria AS pz
LEFT JOIN person_visits AS pv ON pz.id = pv.pizzeria_id
WHERE pv.id IS NULL