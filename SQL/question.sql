
-- 1. Handling NULL Values
-- How do you handle NULL values in SQL? Provide examples of using COALESCE and NULLIF.
     - `COALESCE` returns the first non-NULL value in the list.
     - `NULLIF` returns NULL if the two compared values are equal.

 - SELECT COALESCE(column1, 'default_value') FROM table;
 - SELECT NULLIF(column1, column2) FROM table;

-- 2. Give customer_names of the persons who have not bought 'C'
'''
      -- Customers table:
    -- +-------------+---------------+
    -- | customer_id | customer_name |
    -- +-------------+---------------+
    -- | 1           | Daniel        |
    -- | 2           | Diana         |
    -- | 3           | Elizabeth     |
    -- | 4           | Jhon          |
    -- +-------------+---------------+
    -- Orders table:
    -- +------------+--------------+---------------+
    -- | order_id   | customer_id  | product_name  |
    -- +------------+--------------+---------------+
    -- | 10         |     1        |     A         |
    -- | 20         |     1        |     B         |
    -- | 30         |     1        |     D         |
    -- | 40         |     1        |     C         |
    -- | 50         |     2        |     A         |
    -- | 60         |     3        |     A         |
    -- | 70         |     3        |     B         |
    -- | 80         |     3        |     D         |
    -- | 90         |     4        |     C         |
'''


-- 3. Top N per Group
-- sales(product_id, salesperson_id, sales_amount)
-- Write a SQL query to find the top 3 sales amounts for each `salesperson_id`.

SELECT
         salesperson_id,
         product_id,
         sales_amount
     FROM (
         SELECT
             salesperson_id,
             product_id,
             sales_amount,
             ROW_NUMBER() OVER (PARTITION BY salesperson_id ORDER BY sales_amount DESC) AS rank
         FROM sales
     ) ranked_sales
     WHERE rank <= 3;

--- Approach 2 
--- ## correlated subquery. Heres how you can write the query:
SELECT 
    s1.salesperson_id, 
    s1.sales_amount
FROM 
    Sales s1
WHERE 
    (
        SELECT COUNT(DISTINCT s2.sales_amount) 
        FROM Sales s2 
        WHERE s2.salesperson_id = s1.salesperson_id 
        AND s2.sales_amount > s1.sales_amount
    ) < 3
ORDER BY 
    s1.salesperson_id, s1.sales_amount DESC;


* Correlated Subquery: The subquery (SELECT COUNT(DISTINCT s2.sales_amount) ...) counts how many distinct sales amounts are 
greater than the current rows sales_amount for the same salesperson_id.

* WHERE ... < 3: The query filters out rows where there are already 3 or more distinct sales amounts greater than the current one. 
This ensures that only the top 3 sales amounts are returned.
 
* ORDER BY s1.salesperson_id, s1.sales_amount DESC: Finally, the results are ordered by salesperson_id and then by sales amount in 
descending order.

This approach avoids the use of window functions and directly filters the top 3 sales amounts using a correlated subquery.

-- 5. Data Aggregation
-- Given a sales(date, product_id,amount) , 
-- write a SQL query to calculate the 7-day rolling average of sales for each product.

| Date       | ProductID | Amount | rolling_avg_7_days |
|------------|-----------|--------|--------------------|
| 2024-08-01 | 1         | 100    | 100                |
| 2024-08-02 | 1         | 150    | 125                |
| 2024-08-03 | 1         | 200    | 150                |
| 2024-08-04 | 1         | 250    | 175                |
| 2024-08-05 | 1         | 300    | 200                |
| 2024-08-06 | 1         | 350    | 225                |
| 2024-08-07 | 1         | 400    | 250                |
| 2024-08-08 | 1         | 450    | 300                |

-- 6. To calculate the 7-day rolling average of sales for each product, you can use the `WINDOW` 
-- function with a range-based window specification. Heres how you can write the SQL query to achieve this:

SELECT
    date,
    product_id,
    amount,
    AVG(Amount) OVER (
        PARTITION BY product_id
        ORDER BY Date
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS rolling_avg_7_days
FROM
    Sales
ORDER BY
    product_id,
    date;


-- Write a SQL query to pivot a table, turning rows into columns.
-- To pivot a table in SQL Server, you can use the `PIVOT` operator. This operator allows you to convert 
-- rows into columns, typically used for summarizing data.
-- Suppose you have a table named `Sales` with the following structure:

| SalesPerson | Product  | Amount |
|-------------|----------|--------|
| Alice       | ProductA | 100    |
| Alice       | ProductB | 150    |
| Bob         | ProductA | 120    |
| Bob         | ProductC | 130    |

You want to pivot this table to show the total sales amount by each salesperson for each product.

### Pivot Query:

SELECT SalesPerson, 
       [ProductA], 
       [ProductB], 
       [ProductC]
FROM 
(
    SELECT SalesPerson, Product, Amount
    FROM Sales
) AS SourceTable
PIVOT
(
    SUM(Amount)
    FOR Product IN ([ProductA], [ProductB], [ProductC])
) AS PivotTable;

--### Explanation:
- The inner query (`SourceTable`) selects the `SalesPerson`, `Product`, and `Amount` columns.
- The `PIVOT` operator aggregates the `Amount` values by `SalesPerson` for each `Product`.
- The `FOR Product IN ([ProductA], [ProductB], [ProductC])` clause specifies the values from the `Product` column that should 
become new columns.

### Result:

| SalesPerson | ProductA | ProductB | ProductC |
|-------------|----------|----------|----------|
| Alice       | 100      | 150      | NULL     |
| Bob         | 120      | NULL     | 130      |

This query transforms the rows into columns based on the `Product` values.


-- Problem: 
-- You have a table called Sales, which records the sales amount of a product on different dates. 
-- sales(salesID,salesDate,salesAmount)
-- You want to calculate the difference between each sale and the previous one and also calculate the 
-- difference between each sale and the next one

-- Sample Table: `Sales`

| SaleID | SaleDate   | SalesAmount |
|--------|------------|-------------|
| 1      | 2024-09-10 | 100         |
| 2      | 2024-09-11 | 150         |
| 3      | 2024-09-12 | 120         |
| 4      | 2024-09-13 | 200         |
| 5      | 2024-09-14 | 180         |

SELECT 
    SaleID, 
    SaleDate, 
    SalesAmount,
    LAG(SalesAmount, 1) OVER (ORDER BY SaleDate) AS PreviousSalesAmount,
    LEAD(SalesAmount, 1) OVER (ORDER BY SaleDate) AS NextSalesAmount,
    SalesAmount - LAG(SalesAmount, 1) OVER (ORDER BY SaleDate) AS DiffWithPrevious,
    LEAD(SalesAmount, 1) OVER (ORDER BY SaleDate) - SalesAmount AS DiffWithNext
FROM Sales;
```

### Explanation:
- `LAG(SalesAmount, 1)`: Gets the sales amount from the previous row.
- `LEAD(SalesAmount, 1)`: Gets the sales amount from the next row.
- `DiffWithPrevious`: The difference between the current sales amount and the previous one.
- `DiffWithNext`: The difference between the current sales amount and the next one.

### Output:

| SaleID | SaleDate   | SalesAmount | PreviousSalesAmount | NextSalesAmount | DiffWithPrevious | DiffWithNext |
|--------|------------|-------------|---------------------|-----------------|------------------|--------------|
| 1      | 2024-09-10 | 100         | NULL                | 150             | NULL             | 50           |
| 2      | 2024-09-11 | 150         | 100                 | 120             | 50               | -30          |
| 3      | 2024-09-12 | 120         | 150                 | 200             | -30              | 80           |
| 4      | 2024-09-13 | 200         | 120                 | 180             | 80               | -20          |
| 5      | 2024-09-14 | 180         | 200                 | NULL            | -20              | NULL         |

### Notes:
- The first row doesn't have a previous row, so `LAG()` returns `NULL`.
- The last row doesn't have a next row, so `LEAD()` returns `NULL`.

####Heres a problem with a solution using both `LAG()` and `LEAD()` window functions in SQL Server. These functions allow you to 
access data from the previous or next row within the result set, based on an ordering.
