INSERT INTO person_visits
VALUES(
  		(SELECT MAX(iD) + 1 FROm person_visits), 
		(SELECT id FROM person WHERE name = 'Dmitriy'), 
		(SELECT id FROM pizzeria  
         WHERE name NOT IN(SELECT pizzeria_name FROM mv_dmitriy_visits_and_eats) 
         	AND id IN (SELECT pizzeria_id FROM menu WHERE price < 800)
         LIMIT 1), 
		'2022-01-08'
);

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;