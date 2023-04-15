CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(IN pperson varchar DEFAULT 'Dmitriy', 
															  IN pprice numeric DEFAULT 500, 
															  IN pdate date DEFAULT '2022-01-08')
RETURNS TABLE (name VARCHAR) AS 
$$ 
BEGIN
	RETURN QUERY
	SELECT DISTINCT(pz.name)
	FROM person_order po
	JOIN menu me ON po.menu_id = me.id
	JOIN person_visits pv 
		ON po.person_id = pv.person_id 
			AND me.pizzeria_id = pv.pizzeria_id 
			AND po.order_date = pv.visit_date
	JOIN pizzeria pz ON pz.id = pv.pizzeria_id
	JOIN person pr ON pr.id = pv.person_id
	WHERE pr.name = pperson AND me.price < pprice AND pv.visit_date = pdate;
END;
$$ LANGUAGE plpgsql;

