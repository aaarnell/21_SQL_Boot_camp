SELECT pr.name
FROM person AS pr
WHERE EXISTS (
	SELECT 1 
	FROM person_order 
	WHERE person_id = pr.id
)
ORDER BY pr.name
