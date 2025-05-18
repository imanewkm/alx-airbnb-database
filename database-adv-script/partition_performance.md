# Partitioning Performance Report

## Objective
Optimize query performance on the large `Booking` table by implementing table partitioning based on the `start_date` column.

## Implementation
- Partitioned the `Booking` table by `RANGE` on the `start_date` column.
- Saved the partitioning SQL script in `partitioning.sql`.

## Observed Improvements

- **Query Speed:**  
    Fetching bookings by date range is significantly faster on the partitioned table. Queries that previously took several seconds now execute in a fraction of the time.

- **Resource Usage:**  
    Reduced CPU and I/O usage during date-based queries, as only relevant partitions are scanned.

- **Scalability:**  
    The partitioned table handles larger datasets more efficiently, with consistent query performance as data volume increases.

## Conclusion
Partitioning the `Booking` table by `start_date` greatly improved query performance and resource efficiency for date-based queries.
