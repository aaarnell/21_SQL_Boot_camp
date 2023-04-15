WITH RECURSIVE city_a AS (
    SELECT 
        cost AS total_cost, 
        node1 AS tour, 
        node1, 
        node2
    FROM routes
    WHERE node1 = 'A'
    UNION ALL
    SELECT
        parent.total_cost + child.cost,
        CONCAT(parent.tour, ',', child.node1),
        child.node1,
        child.node2
    FROM
        routes AS child
    INNER JOIN city_a AS parent ON child.node1 = parent.node2
    WHERE tour NOT LIKE CONCAT('%', child.node1, '%')
)

SELECT 
    total_cost, 
    CONCAT('{', tour, ',', node2, '}') AS path
FROM city_a
WHERE 
    node2 = 'A' 
    AND LENGTH(tour) = 7 
ORDER BY total_cost, path;