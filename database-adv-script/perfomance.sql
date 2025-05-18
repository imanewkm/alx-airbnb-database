-- Initial Query: Retrieve all bookings with user, property, and payment details
SELECT
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.id AS user_id,
    u.name AS user_name,
    u.email AS user_email,
    p.id AS property_id,
    p.name AS property_name,
    p.location,
    pay.id AS payment_id,
    pay.amount,
    pay.status,
    pay.payment_date
FROM
    bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON b.id = pay.booking_id
WHERE b.start_date >= '2023-01-01' AND pay.status = 'completed';

EXPLAIN
SELECT
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.id AS user_id,
    u.name AS user_name,
    u.email AS user_email,
    p.id AS property_id,
    p.name AS property_name,
    p.location,
    pay.id AS payment_id,
    pay.amount,
    pay.status
FROM
    bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON b.id = pay.booking_id
WHERE b.start_date >= '2023-01-01' AND pay.status = 'completed';
LEFT JOIN payments pay ON b.id = pay.booking_id;

-- Possible inefficiencies:
-- 1. Missing indexes on foreign keys (bookings.user_id, bookings.property_id, payments.booking_id)
-- 2. Unnecessary columns selected (if not all are needed)
-- 3. LEFT JOIN on payments may return many NULLs if not all bookings have payments

-- Refactored Query: Add indexes and select only necessary columns
-- (Run these CREATE INDEX statements separately if not already indexed)
-- CREATE INDEX idx_bookings_user_id ON bookings(user_id);
-- CREATE INDEX idx_bookings_property_id ON bookings(property_id);
SELECT
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.name AS user_name,
    p.name AS property_name,
    pay.amount,
    pay.status
FROM
    bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON b.id = pay.booking_id
WHERE b.start_date >= '2023-01-01' AND pay.status = 'completed';
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON b.id = pay.booking_id;