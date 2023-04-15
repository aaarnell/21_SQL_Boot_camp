(SELECT name AS object_name
FROM person
ORDER By object_name)
UNION ALL
(SELECT pizza_name AS object_name
FROM menu
ORDER By object_name)