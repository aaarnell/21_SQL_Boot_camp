INSERT INTO person_order (id, person_id, menu_id, order_date)
VALUES ((SELECT MAX (id) FROM person_visits) + 1, (SELECT id FROM person WHERE name = 'Denis'), (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'),
  '2022-02-24');

INSERT INTO person_order (id, person_id, menu_id, order_date)
VALUES ((SELECT MAX (id) FROM person_visits) + 1, (SELECT id FROM person WHERE name = 'Irina'), (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'),
  '2022-02-24');
  