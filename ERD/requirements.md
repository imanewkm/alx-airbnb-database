# Entity-Relationship Diagram (ERD) Requirements

## Entities and Attributes

### 1. **User**
- `id` (Primary Key)
- `name`
- `email`
- `password`
- `phone_number`
- `created_at`
- `updated_at`

### 2. **Property**
- `id` (Primary Key)
- `owner_id` (Foreign Key referencing `User.id`)
- `name`
- `description`
- `address`
- `price_per_night`
- `created_at`
- `updated_at`

### 3. **Booking**
- `id` (Primary Key)
- `user_id` (Foreign Key referencing `User.id`)
- `property_id` (Foreign Key referencing `Property.id`)
- `start_date`
- `end_date`
- `total_price`
- `created_at`
- `updated_at`

### 4. **Review**
- `id` (Primary Key)
- `user_id` (Foreign Key referencing `User.id`)
- `property_id` (Foreign Key referencing `Property.id`)
- `rating`
- `comment`
- `created_at`
- `updated_at`

## Relationships
1. **User to Property**: One-to-Many (A user can own multiple properties).
2. **User to Booking**: One-to-Many (A user can make multiple bookings).
3. **Property to Booking**: One-to-Many (A property can have multiple bookings).
4. **User to Review**: One-to-Many (A user can leave multiple reviews).
5. **Property to Review**: One-to-Many (A property can have multiple reviews).

