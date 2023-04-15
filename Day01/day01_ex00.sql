SELECT id AS object_id, pizza_name AS object_name
FROM menu
UNION
SELECT id AS object_id, name AS object_name
FROM person
ORDER By object_id, object_name