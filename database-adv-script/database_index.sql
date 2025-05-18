-- Example: Creating indexes for commonly searched columns
-- Replace 'table_name' and 'column_name' with your actual table and column names

CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_places_city_id ON places(city_id);
CREATE INDEX idx_reviews_user_id ON reviews(user_id);
CREATE INDEX idx_amenities_name ON amenities(name);
CREATE INDEX idx_places_price_by_night ON places(price_by_night);

-- Example queries
EXPLAIN ANALYZE SELECT * FROM users WHERE email = 'test@example.com';
EXPLAIN ANALYZE SELECT * FROM places WHERE city_id = 1;
EXPLAIN ANALYZE SELECT * FROM reviews WHERE user_id = 42;
EXPLAIN ANALYZE SELECT * FROM amenities WHERE name = 'WiFi';
EXPLAIN ANALYZE SELECT * FROM places WHERE price_by_night < 100;
