In SQL Server, indexes are used to improve the speed of data retrieval. The two most common types of indexes are **Clustered Index** and **Non-Clustered Index**. Here's a detailed explanation of the differences between them:

### 1. **Clustered Index**:
A **Clustered Index** sorts and stores the rows of data in the table based on the index key (the column or columns on which the index is created). There can only be **one clustered index** per table because the table's rows are physically stored in this order.

#### Characteristics:
- **Physical ordering**: The data rows are stored on disk in the same order as the index.
- **Only one per table**: Since the physical order of the rows is determined by the clustered index, there can only be one clustered index on a table.
- **Fast data retrieval**: Because the data is stored in the order of the index, it's efficient for range queries and lookups that align with the index.
- **Primary key**: By default, a primary key constraint creates a clustered index.

#### Example:
```sql
CREATE CLUSTERED INDEX idx_EmployeeID
ON Employees(EmployeeID);
```
Here, the `EmployeeID` column is used to create a clustered index, and the rows in the `Employees` table will be stored in ascending order of `EmployeeID`.

### 2. **Non-Clustered Index**:
A **Non-Clustered Index** creates a separate structure that stores the index key and a pointer (reference) to the actual data row. This allows for **multiple non-clustered indexes** on a table. The data in the table is not sorted according to the non-clustered index.

#### Characteristics:
- **Logical ordering**: The data is not physically rearranged in the table. The index contains a pointer to the actual data row.
- **Multiple per table**: A table can have multiple non-clustered indexes (up to 999 in SQL Server).
- **More flexible**: You can create indexes on different columns or combinations of columns to optimize different types of queries.
- **Slightly slower than clustered**: Since the data is not stored in the order of the index, extra lookups (called "bookmark lookups") are required to retrieve the data rows.

#### Example:
```sql
CREATE NONCLUSTERED INDEX idx_LastName
ON Employees(LastName);
```
Here, the `LastName` column is used to create a non-clustered index, which helps to quickly search for records based on the last name.

### Key Differences Between Clustered and Non-Clustered Indexes:

| Feature                 | Clustered Index                                      | Non-Clustered Index                        |
|-------------------------|------------------------------------------------------|--------------------------------------------|
| **Number per table**    | Only 1 per table                                     | Multiple per table (up to 999)             |
| **Data storage**        | Stores the actual data rows in the index             | Stores only pointers to the data rows      |
| **Physical order**      | Rows are physically stored in the order of the index | No effect on physical storage order         |
| **Data access**         | Faster for retrieving rows in the index order        | Slower compared to clustered due to lookups|
| **Use case**            | Optimal for range queries and primary keys           | Best for searching by columns other than the clustered index |

### Example Scenario:
- **Clustered Index**: You create a clustered index on the `OrderID` column in an `Orders` table. The table is now stored in ascending order of `OrderID`, and any queries that involve searching by `OrderID` will be fast.
- **Non-Clustered Index**: You add a non-clustered index on the `CustomerID` column in the same `Orders` table. Now, SQL Server can quickly find orders by `CustomerID`, but it will still have to follow pointers to the actual rows since they are ordered by `OrderID`.

### Visual Representation:
- **Clustered Index**: Think of it as a phonebook where names are listed alphabetically, and you can quickly find names and phone numbers because they are stored in alphabetical order.
- **Non-Clustered Index**: Think of it as an index at the back of a textbook. You can find the topic you are looking for, but you still need to go to the correct page in the book to read the content.