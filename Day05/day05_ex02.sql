CREATE INDEX idx_person_name ON person USING btree(UPPER(name));

set enable_seqscan=OFF;

EXPLAIN ANALYZE
SELECT name
FROm person
WHERE UPPER(name) = 'ANDREY';