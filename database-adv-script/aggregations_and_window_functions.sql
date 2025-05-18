-- aggregations_and_window_functions.sql

-- Query 1: Total number of bookings made by each user
SELECT 
    user_id,
    CONCAT(users.first_name, ' ', users.last_name) AS user_name,
    COUNT(*) AS total_bookings
FROM 
    bookings
JOIN 
    users ON bookings.user_id = users.id
GROUP BY 
    user_id, users.first_name, users.last_name
ORDER BY 
    total_bookings DESC;

-- Query 2: Ranking properties based on total bookings using window functions
SELECT 
    p.id AS property_id,
    p.name AS property_name,
    p.city,
    COUNT(b.id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.id) DESC) AS row_num_rank,
    RANK() OVER (ORDER BY COUNT(b.id) DESC) AS rank_position,
    DENSE_RANK() OVER (ORDER BY COUNT(b.id) DESC) AS dense_rank_position
FROM 
    properties p
LEFT JOIN 
    bookings b ON p.id = b.property_id
GROUP BY 
    p.id, p.name, p.city
ORDER BY 
    total_bookings DESC;

-- Note: The difference between ROW_NUMBER, RANK and DENSE_RANK:
-- ROW_NUMBER: Assigns unique sequential numbers (no ties)
-- RANK: Same values get same rank, but creates gaps in sequence
-- DENSE_RANK: Same values get same rank, no gaps in sequence
