

Here are some **theory-based SQL interview questions** for a **Senior Data Engineer** role. These questions are aimed at testing deep knowledge of SQL concepts, optimization, scalability, and best practices, which are crucial for senior data engineering roles.

### 1. **What are different types of SQL joins? Explain each with examples.**
   - **Purpose:** Tests the candidate's understanding of joins and their application.
   - **Expected Answer:** Explanation of inner join, left (outer) join, right (outer) join, full outer join, cross join, semi join, and anti join with basic examples.

### 2. **What is the difference between a primary key and a unique key? Can a table have multiple unique keys?**
   - **Purpose:** Tests knowledge of constraints and schema design.
   - **Expected Answer:** Explanation of primary key (which ensures uniqueness and cannot have `NULL` values) and unique key (which allows one `NULL` value). Yes, a table can have multiple unique keys.

### 3. **Explain indexing in SQL. What are the different types of indexes? When should you use indexes?**
   - **Purpose:** Tests understanding of database indexing, performance tuning, and query optimization.
   - **Expected Answer:** Explanation of clustered, non-clustered, composite, unique, full-text, and bitmap indexes. Understanding the impact of indexes on performance and their usage in speeding up SELECT queries but slowing down INSERT/UPDATE operations.

### 4. **What are the differences between OLTP and OLAP databases, and how do SQL queries differ in each?**
   - **Purpose:** Tests knowledge of database systems and their specific query patterns.
   - **Expected Answer:** OLTP (Online Transaction Processing) is optimized for transactional operations, focusing on INSERT/UPDATE/DELETE queries. OLAP (Online Analytical Processing) is optimized for complex SELECT queries and used in data warehousing environments.

### 5. **What is a materialized view? How is it different from a regular view?**
   - **Purpose:** Tests knowledge of views and materialized views.
   - **Expected Answer:** A materialized view is a physical copy of the data that can be periodically refreshed, whereas a regular view is a virtual table based on a SQL query that retrieves data dynamically.

### 6. **How would you approach optimizing a slow SQL query?**
   - **Purpose:** Tests problem-solving ability in query optimization.
   - **Expected Answer:** Steps might include checking indexes, examining the query execution plan, reducing table scans, using appropriate joins, partitioning tables, avoiding `SELECT *`, optimizing `WHERE` clauses, and reducing subqueries or using CTEs.

### 7. **What are window functions, and how do they differ from aggregate functions? Provide an example.**
   - **Purpose:** Tests advanced SQL knowledge, especially about analytical queries.
   - **Expected Answer:** Window functions perform calculations across a set of table rows related to the current row (using `OVER()`), without grouping the results as aggregate functions do. Examples include `ROW_NUMBER()`, `RANK()`, and `SUM()` with an `OVER` clause.

### 8. **What are CTEs (Common Table Expressions), and how are they different from subqueries?**
   - **Purpose:** Tests knowledge of query structuring.
   - **Expected Answer:** CTEs are named temporary result sets that simplify complex queries and improve readability. Unlike subqueries, CTEs can be recursive and used multiple times within the same query.

### 9. **Explain the ACID properties in SQL databases. Why are they important?**
   - **Purpose:** Tests knowledge of database transactions.
   - **Expected Answer:** ACID stands for Atomicity, Consistency, Isolation, and Durability. These properties ensure reliable processing of database transactions.

### 10. **What is the difference between `DELETE`, `TRUNCATE`, and `DROP`? When would you use each?**
   - **Purpose:** Tests understanding of data manipulation and schema management.
   - **Expected Answer:** `DELETE` removes rows one by one, can be rolled back, and uses a WHERE clause. `TRUNCATE` is faster, removes all rows, and cannot be rolled back (in most databases). `DROP` removes the entire table structure from the database.

### 11. **Explain data partitioning and sharding. How do they help in performance scaling?**
   - **Purpose:** Tests knowledge of database scaling techniques.
   - **Expected Answer:** Data partitioning divides large tables into smaller, more manageable parts (horizontal or vertical) for performance and scalability. Sharding distributes data across multiple database servers for scalability in distributed systems.

### 12. **What is a transaction, and how do you ensure transaction integrity in SQL?**
   - **Purpose:** Tests knowledge of SQL transaction management.
   - **Expected Answer:** A transaction is a unit of work that is executed independently to ensure data integrity. Transaction integrity is ensured using the ACID properties. Commands such as `BEGIN`, `COMMIT`, and `ROLLBACK` control the transactional workflow.

### 13. **How does database normalization work? Explain the different normal forms.**
   - **Purpose:** Tests understanding of schema design.
   - **Expected Answer:** Database normalization involves organizing tables to minimize redundancy. The candidate should explain normal forms like 1NF, 2NF, 3NF, BCNF, and their rules.

### 14. **What are the different isolation levels in SQL, and how do they affect concurrency?**
   - **Purpose:** Tests knowledge of isolation levels and transaction management.
   - **Expected Answer:** SQL defines isolation levels as `READ UNCOMMITTED`, `READ COMMITTED`, `REPEATABLE READ`, and `SERIALIZABLE`. These control the visibility of changes made by one transaction to others, managing issues like dirty reads, non-repeatable reads, and phantom reads.

### 15. **What is a deadlock in SQL databases? How can it be detected and resolved?**
   - **Purpose:** Tests understanding of concurrency issues.
   - **Expected Answer:** A deadlock occurs when two or more transactions block each other by holding locks on resources the other needs. Deadlock detection can be done using database logs, and resolution usually involves transaction rollbacks.

### 16. **What is denormalization? Why would you choose to denormalize a database?**
   - **Purpose:** Tests knowledge of database design trade-offs.
   - **Expected Answer:** Denormalization involves adding redundancy to a database design to improve read performance at the expense of write performance. It's often used in data warehousing or OLAP systems where read performance is more critical.

### 17. **Explain how SQL handles NULL values in comparisons and aggregate functions.**
   - **Purpose:** Tests detailed understanding of how SQL treats `NULL`.
   - **Expected Answer:** `NULL` represents an unknown or missing value in SQL. Comparisons involving `NULL` always result in `NULL`, except when using `IS NULL` or `IS NOT NULL`. Aggregates like `COUNT` ignore `NULL` values unless specifically handled.

### 18. **How does indexing affect the performance of queries involving `JOIN` operations?**
   - **Purpose:** Tests knowledge of indexing in complex query scenarios.
   - **Expected Answer:** Indexing columns involved in `JOIN` operations can significantly improve query performance by reducing the amount of data that needs to be scanned. However, the effectiveness depends on the type of join and the size of the dataset.

### 19. **What are surrogate keys, and how do they differ from natural keys?**
   - **Purpose:** Tests understanding of key selection in schema design.
   - **Expected Answer:** Surrogate keys are artificial, system-generated keys (e.g., auto-incremented integers), while natural keys are derived from the data itself. Surrogate keys ensure uniqueness without relying on domain-specific knowledge.

### 20. **What are database triggers, and when should they be used or avoided?**
   - **Purpose:** Tests knowledge of advanced SQL features.
   - **Expected Answer:** Triggers are special stored procedures that execute automatically in response to certain events (INSERT, UPDATE, DELETE). They are useful for enforcing business rules but should be used sparingly as they can complicate debugging and degrade performance.

These questions cover a range of topics, from query optimization to advanced database design, that are vital for senior data engineers handling complex SQL environments.