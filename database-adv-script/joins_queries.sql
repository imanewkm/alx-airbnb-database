-- 1. INNER JOIN: Retrieve all bookings and the respective users who made those bookings
SELECT bookings.*, users.*
FROM bookings
INNER JOIN users ON bookings.user_id = users.id;

-- 2. LEFT JOIN: Retrieve all properties and their reviews, including properties that have no reviews
SELECT properties.*, reviews.id AS review_id, reviews.property_id, reviews.user_id, reviews.rating, reviews.comment, reviews.created_at
FROM properties
LEFT JOIN reviews ON properties.id = reviews.property_id
ORDER BY properties.id, reviews.id;

-- 3. FULL OUTER JOIN: Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user
SELECT users.*, bookings.*
FROM users
FULL OUTER JOIN bookings ON users.id = bookings.user_id;
