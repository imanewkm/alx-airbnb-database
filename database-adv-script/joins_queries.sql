-- 2. LEFT JOIN: Retrieve all properties and their reviews, including properties that have no reviews
SELECT properties.*, reviews.id AS review_id, reviews.property_id, reviews.user_id, reviews.rating, reviews.comment, reviews.created_at
FROM properties
LEFT JOIN reviews ON properties.id = reviews.property_id
ORDER BY properties.id, reviews.id;
