-- Example: Creating indexes for commonly searched columns
-- Replace 'table_name' and 'column_name' with your actual table and column names

CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_places_city_id ON places(city_id);
CREATE INDEX idx_reviews_user_id ON reviews(user_id);
CREATE INDEX idx_amenities_name ON amenities(name);
CREATE INDEX idx_places_price_by_night ON places(price_by_night);
