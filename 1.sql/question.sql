Here are the top 10 SQL questions tailored for a senior data engineer interview:

### 1. **Window Functions**
   - **Question:** Explain what window functions are in SQL and provide an example of how they can be used to calculate a running total or a moving average.
   - **Expected Answer:** Window functions allow performing calculations across a set of table rows related to the current row. Example:
     ```sql
     SELECT
         order_id,
         customer_id,
         order_date,
         SUM(amount) OVER (ORDER BY order_date) AS running_total
     FROM
         orders;
     ```

### 2. **Query Optimization**
   - **Question:** A query you wrote is running slow. What steps would you take to optimize it?
   - **Expected Answer:** Review indexes, check query execution plan, avoid using `SELECT *`, use proper joins, avoid subqueries in favor of CTEs, and consider query rewriting or denormalization if needed.

### 3. **JOIN Types**
   - **Question:** Explain the differences between INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL OUTER JOIN with examples.
   - **Expected Answer:**
     - `INNER JOIN` returns records with matching values in both tables.
     - `LEFT JOIN` returns all records from the left table and matched records from the right table.
     - `RIGHT JOIN` returns all records from the right table and matched records from the left table.
     - `FULL OUTER JOIN` returns all records when there is a match in either left or right table.

### 4. **Recursive Queries**
   - **Question:** How would you write a recursive SQL query to traverse a hierarchical data structure, such as an employee reporting hierarchy?
   - **Expected Answer:**
     ```sql
     WITH RECURSIVE EmployeeCTE AS (
         SELECT employee_id, manager_id, employee_name, 1 AS level
         FROM employees
         WHERE manager_id IS NULL
         
         UNION ALL
         
         SELECT e.employee_id, e.manager_id, e.employee_name, cte.level + 1
         FROM employees e
         JOIN EmployeeCTE cte ON e.manager_id = cte.employee_id
     )
     SELECT * FROM EmployeeCTE;
     ```

### 5. **Advanced Aggregations**
   - **Question:** Write a SQL query to find the second highest salary in a table.
   - **Expected Answer:**
     ```sql
     SELECT MAX(salary) AS SecondHighestSalary
     FROM employees
     WHERE salary < (SELECT MAX(salary) FROM employees);
     ```

### 6. **Handling NULL Values**
   - **Question:** How do you handle NULL values in SQL? Provide examples of using COALESCE and NULLIF.
   - **Expected Answer:** 
     - `COALESCE` returns the first non-NULL value in the list.
     - `NULLIF` returns NULL if the two compared values are equal.
     ```sql
     SELECT COALESCE(column1, 'default_value') FROM table;
     SELECT NULLIF(column1, column2) FROM table;
     ```

### 7. **Indexes**
   - **Question:** What are indexes in SQL, and how do they impact query performance? When would you use a composite index?
   - **Expected Answer:** Indexes speed up data retrieval but can slow down write operations. A composite index is used when you frequently query multiple columns together.

### 8. **Pivot and Unpivot**
   - **Question:** How would you pivot data in SQL to convert rows into columns? Provide an example.
   - **Expected Answer:**
     ```sql
     SELECT 
         product,
         SUM(CASE WHEN year = '2020' THEN sales END) AS sales_2020,
         SUM(CASE WHEN year = '2021' THEN sales END) AS sales_2021
     FROM sales_data
     GROUP BY product;
     ```

### 9. **Partitioning**
   - **Question:** Explain the concept of table partitioning in SQL. How does it improve performance, and when would you use it?
   - **Expected Answer:** Partitioning divides a large table into smaller, more manageable pieces, improving query performance and maintenance tasks. Use it when dealing with large datasets that can be logically separated, e.g., by date.

### 10. **Data Integrity and Constraints**
   - **Question:** What are the different types of constraints in SQL, and how do they ensure data integrity?
   - **Expected Answer:**
     - **PRIMARY KEY**: Ensures each record is unique.
     - **FOREIGN KEY**: Ensures referential integrity between tables.
     - **UNIQUE**: Ensures all values in a column are unique.
     - **CHECK**: Ensures that all values in a column meet specific conditions.
     - **NOT NULL**: Ensures a column cannot have NULL values.

These questions should help assess a candidate's deep understanding of SQL, their ability to optimize and troubleshoot queries, and their familiarity with advanced SQL concepts.