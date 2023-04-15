SELECT pr.address,
	ROUND(MAX(pr.age) - (MIN(pr.age) / MAX(pr.age)), 2) formula,
	ROUND(AVG(pr.age), 2) average,
	CASE
		WHEN MAX(pr.age) - (MIN(pr.age) / MAX(pr.age)) > AVG(pr.age) THEN true
		ELSE false
	END
FROM 
	(SELECT address, age::numeric
	 FROM person) pr
GROUP BY address
ORDER BY address
