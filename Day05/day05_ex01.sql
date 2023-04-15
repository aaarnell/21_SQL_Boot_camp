set enable_seqscan=OFF;

EXPLAIN ANALYZE
SELECT pizza_name, pzr.name AS pizzeria_name
FROM menu me
JOIN pizzeria pzr ON pzr.id = me.pizzeria_id;