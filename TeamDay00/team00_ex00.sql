-- Create the routes table
CREATE TABLE routes (
    node1 VARCHAR NOT NULL,
    node2 VARCHAR NOT NULL,
    cost INTEGER NOT NULL
);

-- Insert sample data into the routes table
INSERT INTO routes
VALUES
    ('A', 'B', 10), ('B', 'A', 10), ('A', 'C', 15), ('C', 'A', 15),
    ('A', 'D', 20), ('D', 'A', 20), ('D', 'B', 25), ('B', 'D', 25),
    ('D', 'C', 30), ('C', 'D', 30), ('C', 'B', 35), ('B', 'C', 35);

-- Find the shortest route that starts and ends at node 'A' with a tour length of 7
WITH RECURSIVE city_a AS (
    -- Base case: select all routes starting from node 'A'
    SELECT 
        cost AS total_cost, 
        node1 AS tour, 
        node1, 
        node2
    FROM routes
    WHERE node1 = 'A'
    
    UNION ALL
    
    -- Recursive step: find the next node in the path
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
    AND total_cost = (
        SELECT MIN(total_cost) 
        FROM city_a 
        WHERE LENGTH(tour) = 7
    )
ORDER BY total_cost, path;
