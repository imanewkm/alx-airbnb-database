# ALX Airbnb Database - Sample Data Population

## Objective

The goal of this project is to create SQL scripts that populate the database with realistic sample data. This data will be used to simulate real-world scenarios for entities such as `User`, `Property`, `Booking`, and more.

## Instructions

1. **Write SQL INSERT Statements**  
    - Create SQL scripts to insert sample data into the database tables.  
    - Ensure the data is meaningful and reflects real-world usage.

2. **Entities to Populate**  
    - `User`: Add multiple users with attributes like name, email, and phone number.  
    - `Property`: Add various properties with details such as location, price, and description.  
    - `Booking`: Add bookings that link users to properties with relevant dates and statuses.  
    - `Payment`: Add payment records associated with bookings.

3. **Best Practices**  
    - Use realistic data for all fields (e.g., valid email addresses, plausible dates).  
    - Ensure relationships between tables are consistent (e.g., valid foreign keys).  
    - Avoid duplicate entries and maintain data integrity.

## Example

Here is an example of an `INSERT` statement for the `User` table:

```sql
INSERT INTO User (id, name, email, phone)
VALUES (1, 'John Doe', 'john.doe@example.com', '123-456-7890');
```

## Deliverables

- SQL scripts for populating the database with sample data.  
- Ensure the scripts can be executed without errors on the database schema.

## Notes

- Test the scripts to verify that the data is inserted correctly.  
- Use comments in the SQL scripts to explain complex queries or relationships.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.
