SELECT pe.name, COUNT(person_id) AS count_of_visits
FROM person_visits pv
JOIN person pe ON pe.id = pv.person_id
GROUP BY pe.name
ORDER BY count_of_visits DESC, pe.name ASC
LIMIT 4