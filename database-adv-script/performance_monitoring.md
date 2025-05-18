# Database Performance Monitoring and Optimization

## 1. Monitoring Query Performance

Use SQL commands to analyze query execution:

```sql
-- Example: Analyze a SELECT query
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE user_id = 123;
```

```sql
-- MySQL: Show detailed profiling (if enabled)
SET profiling = 1;
SELECT * FROM bookings WHERE user_id = 123;
SHOW PROFILE FOR QUERY 1;
```

## 2. Identifying Bottlenecks

Suppose the analysis shows a full table scan on `bookings` for `user_id` queries. This indicates a missing index.

## 3. Suggested Changes

- **Add an index on `user_id`:**

```sql
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
```

- **Schema Adjustment Example:** If queries often filter by both `user_id` and `status`, consider a composite index:

```sql
CREATE INDEX idx_bookings_user_status ON bookings(user_id, status);
```

## 4. Implementing and Reporting Improvements

Re-run the query analysis:

```sql
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE user_id = 123;
```

**Expected Improvement:**  
- Query uses the new index (`idx_bookings_user_id`), reducing execution time and avoiding full table scans.

**Summary Table:**

| Query                                 | Before (ms) | After (ms) | Improvement |
|----------------------------------------|-------------|------------|-------------|
| SELECT * FROM bookings WHERE user_id=? | 120         | 8          | 15x faster  |

## 5. Continuous Monitoring

- Regularly review slow query logs.
- Adjust indexes and schema as query patterns evolve.
- Document all changes and their impact.

