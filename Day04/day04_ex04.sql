CREATE VIEW v_symmetric_union AS
	SELECT pv1.person_id
	FROM
		(SELECT *
		FROM person_visits
		WHERE visit_date = '2022-01-02') AS pv1
	LEFT JOIN
		(SELECT *
		FROM person_visits
		WHERE visit_date = '2022-01-06') AS pv2 ON pv1.person_id = pv2.person_id
	WHERE pv2.person_id IS NULL
	UNION ALL
	SELECT pv2.person_id
	FROM
		(SELECT *
		FROM person_visits
		WHERE visit_date = '2022-01-02') AS pv1
	RIGHT join
		(SELECT *
		FROM person_visits
		WHERE visit_date = '2022-01-06') AS pv2 ON pv1.person_id = pv2.person_id
	WHERE pv1.person_id IS NULL
	ORDER BY person_id;