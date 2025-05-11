-- Insert sample data into the User table
INSERT INTO User (id, name, email, password, created_at)
VALUES 
(1, 'John Doe', 'john.doe@example.com', 'password123', NOW()),
(2, 'Jane Smith', 'jane.smith@example.com', 'securepass456', NOW()),
(3, 'Alice Johnson', 'alice.johnson@example.com', 'mypassword789', NOW());

-- Insert sample data into the Property table
INSERT INTO Property (id, user_id, name, location, price_per_night, created_at)
VALUES 
(1, 1, 'Cozy Apartment', 'New York, NY', 120.00, NOW()),
(2, 2, 'Beach House', 'Miami, FL', 250.00, NOW()),
(3, 3, 'Mountain Cabin', 'Denver, CO', 180.00, NOW());

-- Insert sample data into the Booking table
INSERT INTO Booking (id, user_id, property_id, start_date, end_date, total_price, created_at)
VALUES 
(1, 2, 1, '2023-11-01', '2023-11-05', 480.00, NOW()),
(2, 3, 2, '2023-12-15', '2023-12-20', 1250.00, NOW()),
(3, 1, 3, '2024-01-10', '2024-01-15', 900.00, NOW());

-- Insert sample data into the Payment table
INSERT INTO Payment (id, booking_id, amount, payment_date, payment_method, created_at)
VALUES 
(1, 1, 480.00, '2023-10-25', 'Credit Card', NOW()),
(2, 2, 1250.00, '2023-12-01', 'PayPal', NOW()),
(3, 3, 900.00, '2024-01-05', 'Bank Transfer', NOW());