SELECT 
	pe.name, 
	COUNT(*) AS count_visits
FROM person_visits pv
JOIN person pe ON pe.id = pv.person_id
GROUP BY 
	pe.id
HAVING
	COUNT(*) > 3
ORDER BY
	pe.name