# Index Performance Optimization in AirBnB Clone Database

## Analysis of High-Usage Columns

When optimizing database performance, it's important to identify columns that are frequently used in:
- WHERE clauses (filtering data)
- JOIN conditions (relating tables)
- ORDER BY statements (sorting results)

### Key Columns in Our Database

#### User Table
- `id` (primary key, already indexed)
- `email` (used for login queries)
- `username` (used for searches and display)

#### Property Table
- `id` (primary key, already indexed)
- `owner_id` (foreign key to User table, used in JOINs)
- `city` (frequently filtered)
- `price_per_night` (used in range queries and sorting)
- `status` (filtered for active/inactive properties)

#### Booking Table
- `id` (primary key, already indexed)
- `user_id` (foreign key, used in JOINs)
- `property_id` (foreign key, used in JOINs)
- `check_in_date` (range queries and sorting)
- `status` (filtered for booking status)

## Index Creation SQL Commands

```sql
-- User table indexes
CREATE INDEX idx_user_email ON users(email);
CREATE INDEX idx_user_username ON users(username);

-- Property table indexes
CREATE INDEX idx_property_owner ON properties(owner_id);
CREATE INDEX idx_property_city ON properties(city);
CREATE INDEX idx_property_price ON properties(price_per_night);
CREATE INDEX idx_property_status ON properties(status);
CREATE INDEX idx_property_composite ON properties(city, price_per_night, status);

-- Booking table indexes
CREATE INDEX idx_booking_user ON bookings(user_id);
CREATE INDEX idx_booking_property ON bookings(property_id);
CREATE INDEX idx_booking_dates ON bookings(check_in_date, check_out_date);
CREATE INDEX idx_booking_status ON bookings(status);
```

## Performance Measurement

### Sample Query 1: Find available properties in a city within a price range

#### Before Indexing
```sql
EXPLAIN ANALYZE
SELECT p.* FROM properties p
WHERE p.city = 'New York' 
AND p.price_per_night BETWEEN 100 AND 300
AND p.status = 'active';
```

Results before indexing:
- Sequential scan on properties table
- High execution time
- High cost estimate

#### After Indexing
After adding the composite index `idx_property_composite`, the same query shows:
- Index scan instead of sequential scan
- Significantly reduced execution time
- Lower cost estimate

### Sample Query 2: Find a user's bookings

#### Before Indexing
```sql
EXPLAIN ANALYZE
SELECT b.*, p.name 
FROM bookings b
JOIN properties p ON b.property_id = p.id
WHERE b.user_id = 123
ORDER BY b.check_in_date DESC;
```

Results before indexing:
- Sequential scan on bookings table
- High cost for sorting

#### After Indexing
After adding indexes on `bookings.user_id` and `bookings.check_in_date`:
- Index scan on bookings via user_id
- Uses index for ordering
- Reduced overall execution time

## Conclusion

Adding appropriate indexes has significantly improved query performance, especially for:
- User authentication queries
- Property search filters
- Booking history retrieval

Remember that while indexes improve read performance, they add overhead to write operations. Monitor database performance after implementation to ensure a good balance.