# Index Performance Optimization

## 1. Identify High-Usage Columns

- **User Table:** `email`, `id`
- **Booking Table:** `user_id`, `property_id`, `created_at`
- **Property Table:** `id`, `location`, `price`

These columns are commonly used in `WHERE`, `JOIN`, and `ORDER BY` clauses.

---

## 2. SQL CREATE INDEX Commands

Save the following in `database_index.sql`:

```sql
-- User table indexes
CREATE INDEX idx_user_email ON User(email);

-- Booking table indexes
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_created_at ON Booking(created_at);

-- Property table indexes
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_price ON Property(price);
```

---

## 3. Measure Query Performance

**Before Adding Indexes:**

```sql
EXPLAIN SELECT * FROM Booking WHERE user_id = 123;
```

**After Adding Indexes:**

```sql
EXPLAIN SELECT * FROM Booking WHERE user_id = 123;
```

Compare the query plans and execution times to observe improvements.

---

**Tip:** Use `ANALYZE` for more detailed performance metrics.
