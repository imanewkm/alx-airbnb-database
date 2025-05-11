-- Insert sample data into the User table
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES 
(UUID(), 'John', 'Doe', 'john.doe@example.com', 'hashed_password123', '123-456-7890', 'guest', NOW()),
(UUID(), 'Jane', 'Smith', 'jane.smith@example.com', 'hashed_securepass456', '987-654-3210', 'host', NOW()),
(UUID(), 'Alice', 'Johnson', 'alice.johnson@example.com', 'hashed_mypassword789', NULL, 'admin', NOW());

-- Insert sample data into the Property table
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at)
VALUES 
(UUID(), (SELECT user_id FROM User WHERE email = 'jane.smith@example.com'), 'Cozy Apartment', 'A cozy apartment in the heart of New York.', 'New York, NY', 120.00, NOW(), NOW()),
(UUID(), (SELECT user_id FROM User WHERE email = 'jane.smith@example.com'), 'Beach House', 'A beautiful beach house in Miami.', 'Miami, FL', 250.00, NOW(), NOW()),
(UUID(), (SELECT user_id FROM User WHERE email = 'alice.johnson@example.com'), 'Mountain Cabin', 'A serene mountain cabin in Denver.', 'Denver, CO', 180.00, NOW(), NOW());

-- Insert sample data into the Booking table
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES 
(UUID(), (SELECT property_id FROM Property WHERE name = 'Cozy Apartment'), (SELECT user_id FROM User WHERE email = 'john.doe@example.com'), '2023-11-01', '2023-11-05', 480.00, 'confirmed', NOW()),
(UUID(), (SELECT property_id FROM Property WHERE name = 'Beach House'), (SELECT user_id FROM User WHERE email = 'alice.johnson@example.com'), '2023-12-15', '2023-12-20', 1250.00, 'pending', NOW()),
(UUID(), (SELECT property_id FROM Property WHERE name = 'Mountain Cabin'), (SELECT user_id FROM User WHERE email = 'jane.smith@example.com'), '2024-01-10', '2024-01-15', 900.00, 'confirmed', NOW());

-- Insert sample data into the Payment table
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method, created_at)
VALUES 
(UUID(), (SELECT booking_id FROM Booking WHERE total_price = 480.00), 480.00, '2023-10-25', 'credit_card', NOW()),
(UUID(), (SELECT booking_id FROM Booking WHERE total_price = 1250.00), 1250.00, '2023-12-01', 'paypal', NOW()),
(UUID(), (SELECT booking_id FROM Booking WHERE total_price = 900.00), 900.00, '2024-01-05', 'stripe', NOW());

-- Insert sample data into the Review table
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES 
(UUID(), (SELECT property_id FROM Property WHERE name = 'Cozy Apartment'), (SELECT user_id FROM User WHERE email = 'john.doe@example.com'), 5, 'Amazing place to stay!', NOW()),
(UUID(), (SELECT property_id FROM Property WHERE name = 'Beach House'), (SELECT user_id FROM User WHERE email = 'alice.johnson@example.com'), 4, 'Great location and amenities.', NOW()),
(UUID(), (SELECT property_id FROM Property WHERE name = 'Mountain Cabin'), (SELECT user_id FROM User WHERE email = 'jane.smith@example.com'), 5, 'Perfect getaway!', NOW());

-- Insert sample data into the Message table
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES 
(UUID(), (SELECT user_id FROM User WHERE email = 'john.doe@example.com'), (SELECT user_id FROM User WHERE email = 'jane.smith@example.com'), 'Hi Jane, is the apartment available for next week?', NOW()),
(UUID(), (SELECT user_id FROM User WHERE email = 'jane.smith@example.com'), (SELECT user_id FROM User WHERE email = 'john.doe@example.com'), 'Hi John, yes it is available. Let me know if you want to book.', NOW()),
(UUID(), (SELECT user_id FROM User WHERE email = 'alice.johnson@example.com'), (SELECT user_id FROM User WHERE email = 'jane.smith@example.com'), 'Hi Jane, I loved the beach house. Thanks!', NOW());