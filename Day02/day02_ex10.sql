SELECT DISTINCT p2.name AS person_name1, p1.name AS person_name2, p1.address common_address
FROM person p1
JOIN person p2 ON p1.address = p2.address AND p1.id < p2.id
ORDER BY p2.name, p1.name, p1.address;