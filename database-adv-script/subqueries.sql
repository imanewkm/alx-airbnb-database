-- Finding properties with average rating > 4.0 using a non-correlated subquery
SELECT p.id, p.name, p.description, p.price_per_night
FROM properties p
WHERE p.id IN (
    SELECT r.property_id
    FROM reviews r
    GROUP BY r.property_id
    HAVING AVG(r.rating) > 4.0
);

-- Finding users who have made more than 3 bookings using a correlated subquery
SELECT u.id, u.first_name, u.last_name, u.email
FROM users u
WHERE (
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.user_id = u.id
) > 3;

-- Alternative non-correlated subquery approach for finding users with more than 3 bookings
SELECT u.id, u.first_name, u.last_name, u.email
FROM users u
WHERE u.id IN (
    SELECT user_id
    FROM bookings
    GROUP BY user_id
    HAVING COUNT(*) > 3
);
