-- 1. Create a new partitioned Booking table based on start_date (by year)
CREATE TABLE Booking_partitioned (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(50),
    -- Add other columns as needed
    CHECK (start_date < end_date)
) PARTITION BY RANGE (start_date);

-- 2. Create partitions for years 2022, 2023, 2024, and a default future partition
CREATE TABLE Booking_2022 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2022-01-01') TO ('2023-01-01');

CREATE TABLE Booking_2023 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Booking_2024 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE Booking_future PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2025-01-01') TO ('2100-01-01');

-- 3. (Optional) Insert data from the original Booking table
-- INSERT INTO Booking_partitioned (id, user_id, property_id, start_date, end_date, status)
-- SELECT id, user_id, property_id, start_date, end_date, status FROM Booking;

-- 4. Example: Query performance test (fetch bookings in a date range)
EXPLAIN ANALYZE
SELECT * FROM Booking_partitioned
WHERE start_date BETWEEN '2023-06-01' AND '2023-06-30';

-- 5. (Optional) Drop the old Booking table and rename the partitioned table
-- DROP TABLE Booking;
-- ALTER TABLE Booking_partitioned RENAME TO Booking;
