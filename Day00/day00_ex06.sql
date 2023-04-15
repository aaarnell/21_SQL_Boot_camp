SELECT --po.person_id, 
	(SELECT name FROM person WHERE id = po.person_id) AS name,
    CASE
    	WHEN (SELECT name FROM person WHERE id = po.person_id) = 'Denis' THEN true::text
        ELSE false::text
    END AS check_name
FROM person_order AS po
WHERE (po.menu_id = 13 OR po.menu_id = 14 OR po.menu_id = 18)
	AND po.order_date = '2022-01-07'