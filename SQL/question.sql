# SQL

# A) SQL Basics & Advanced:
'''
1. What are window functions in SQL? Provide examples of how they are used.
3. How would you optimize a slow SQL query?
3. Discuss the differences between OLAP and OLTP databases.
4. Find out duplicates in a table?
'''

#2) Data Aggregation
#Q) Given a sales(date, product_id,amount) , write a SQL query to calculate the 7-day rolling average of sales for each product.
'''
Q) To calculate the 7-day rolling average of sales for each product, you can use the `WINDOW` function with a range-based 
window specification. Heres how you can write the SQL query to achieve this:

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
```

### Explanation:

1. **`SELECT Date, ProductID, Amount`**: This selects the `Date`, `ProductID`, and `Amount` columns from the `Sales` table.
2. **`AVG(Amount) OVER (...) AS rolling_avg_7_days`**: The `AVG()` function calculates the average of the `Amount` values 
over a specified window of rows. The result is aliased as `rolling_avg_7_days`.
3. **`PARTITION BY ProductID`**: This clause partitions the data by `ProductID`, so that the rolling average is calculated 
separately for each product.

4. **`ORDER BY Date`**: This orders the data within each partition by `Date`, which is necessary for calculating the rolling average.

5. **`ROWS BETWEEN 6 PRECEDING AND CURRENT ROW`**: This specifies the window frame for the rolling average calculation. 
It includes the current row and the 6 preceding rows, resulting in a 7-day window (including the current day).

6. **`FROM Sales`**: This specifies the `Sales` table as the source of the data.

7. **`ORDER BY ProductID, Date`**: This ensures the final result is ordered by `ProductID` and `Date`, making it easier 
to interpret the rolling averages over time.

### Sample Data:

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

### Optimization Considerations:

1. **Indexes**: 
   - Ensure there is an index on the `ProductID` and `Date` columns in the `Sales` table. This will help with the partitioning and ordering operations.

2. **Data Size**:
   - For very large datasets, consider partitioning the table by date ranges or using other techniques to manage large data volumes efficiently.

3. **Query Execution Plan**:
   - Check the execution plan to make sure that the query is using indexes appropriately and not performing full table scans or other costly operations.

This query will compute the 7-day rolling average of sales for each product, considering the sales data over the specified window of time.
'''

# SQL 
# Q) Write a SQL query to pivot a table, turning rows into columns.
'''
To pivot a table in SQL Server, you can use the `PIVOT` operator. This operator allows you to convert rows into columns, typically used for summarizing data.

### Example Scenario:
Suppose you have a table named `Sales` with the following structure:

| SalesPerson | Product  | Amount |
|-------------|----------|--------|
| Alice       | ProductA | 100    |
| Alice       | ProductB | 150    |
| Bob         | ProductA | 120    |
| Bob         | ProductC | 130    |

You want to pivot this table to show the total sales amount by each salesperson for each product.

### Pivot Query:

```sql
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
```

### Explanation:
- The inner query (`SourceTable`) selects the `SalesPerson`, `Product`, and `Amount` columns.
- The `PIVOT` operator aggregates the `Amount` values by `SalesPerson` for each `Product`.
- The `FOR Product IN ([ProductA], [ProductB], [ProductC])` clause specifies the values from the `Product` column that should become new columns.

### Result:

| SalesPerson | ProductA | ProductB | ProductC |
|-------------|----------|----------|----------|
| Alice       | 100      | 150      | NULL     |
| Bob         | 120      | NULL     | 130      |

This query transforms the rows into columns based on the `Product` values.
'''