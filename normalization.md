# Database Normalization to Achieve 3NF

## Objective
The goal is to apply normalization principles to ensure the database adheres to the Third Normal Form (3NF), eliminating redundancies and ensuring data integrity.

---

## Steps to Achieve 3NF

### 1. Understand the Current Schema
Analyze the existing database schema to identify:
- Repeating groups
- Partial dependencies
- Transitive dependencies

### 2. Apply First Normal Form (1NF)
- Ensure all columns contain atomic values (no repeating groups or arrays).
- Each row must be unique and identifiable by a primary key.

**Example:**
Before 1NF:
| OrderID | CustomerName | Items         |
|---------|--------------|---------------|
| 1       | John Doe     | Item1, Item2  |

After 1NF:
| OrderID | CustomerName | Item          |
|---------|--------------|---------------|
| 1       | John Doe     | Item1         |
| 1       | John Doe     | Item2         |

---

### 3. Apply Second Normal Form (2NF)
- Remove partial dependencies (non-prime attributes depending on part of a composite primary key).
- Ensure all non-key attributes depend on the entire primary key.

**Example:**
Before 2NF:
| OrderID | ProductID | ProductName | CustomerName |
|---------|-----------|-------------|--------------|

After 2NF:
- Split into two tables:
    - Orders: `OrderID`, `CustomerName`
    - Products: `ProductID`, `ProductName`

---

### 4. Apply Third Normal Form (3NF)
- Remove transitive dependencies (non-key attributes depending on other non-key attributes).
- Ensure all non-key attributes depend only on the primary key.

**Example:**
Before 3NF:
| CustomerID | CustomerName | CustomerCity | CityZip |
|------------|--------------|--------------|---------|

After 3NF:
- Split into two tables:
    - Customers: `CustomerID`, `CustomerName`, `CustomerCity`
    - Cities: `CityZip`, `CustomerCity`

---

## Final Schema
After normalization, the database schema should:
1. Be free of redundancy.
2. Ensure data integrity.
3. Be optimized for queries.

---

## Conclusion
By following the steps above, the database is now in 3NF, ensuring a well-structured and efficient design.
