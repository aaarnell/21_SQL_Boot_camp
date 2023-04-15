CREATE UNIQUE INDEX idx_person_order_order_date ON person_order USING btree(person_id, menu_id) 
WHERE order_date = '2022-01-01';

set enable_seqscan=OFF;

EXPLAIN ANALYZE
SELECT person_id, menu_id
FROM person_order
WHERE order_date = '2022-01-01';