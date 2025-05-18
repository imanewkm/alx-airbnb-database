# Optimization Report Instructions

This document outlines the steps to optimize a SQL query for retrieving booking information in your database.

## Instructions

1. **Write the Initial Query**
    - Create a SQL query that retrieves all bookings, including:
      - User details
      - Property details
      - Payment details
    - Save this query in a file named `perfomance.sql`.

2. **Analyze Query Performance**
    - Use the `EXPLAIN` statement to analyze the performance of your query.
    - Identify any inefficiencies, such as slow joins, missing indexes, or unnecessary data retrieval.

3. **Refactor for Optimization**
    - Modify the query to improve execution time. Consider:
      - Removing unnecessary joins or columns
      - Adding or using appropriate indexes
      - Filtering data as early as possible
    - Document the changes and improvements.

---

By following these steps, you will create an efficient query and document your optimization process.