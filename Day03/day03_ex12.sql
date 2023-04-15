INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT gs, pr.id, menu.id AS menu_id, '2022-02-25' AS order_date
FROM generate_series(
  (SELECT MAX(id) FROM person_order) + 1, 
  (SELECT MAX(id) FROM person_order) + (SELECT COUNT(1) FROM person)
) AS gs
LEFT JOIN person AS pr ON (gs - (SELECT MAX(id) FROM person_order)) = pr.id
LEFT JOIN menu ON menu.pizza_name = 'greek pizza';
