
1. What are PySpark transformations? 
- Transformations in PySpark are lazy operations, meaning they don’t execute immediately. They only run when triggered by an action like 'collect()'. Common transformations include 'map()', 'filter()', and 'join()'.

2. What is PySpark architecture? 
- The driver program coordinates tasks, and worker nodes (containing executors) run tasks in parallel. Executors use cores to process tasks, while the cluster manager allocates resources across nodes.

3. What is a DAG in PySpark? 
- A DAG (Directed Acyclic Graph) is a sequence of computations. When an action like 'count()' is called, PySpark breaks the DAG into stages and executes the operations across the cluster.

4. What are actions in PySpark? 
- Actions trigger the execution of transformations, as Spark uses lazy evaluation. Examples include 'collect()', 'count()', and 'show()', which return results to the driver or write data to external storage.

5. Difference between narrow and wide transformations? 
- Narrow transformations process data within a single partition (e.g., 'map()'). Wide transformations require shuffling data across multiple partitions (e.g., 'join()'), which can be more resource-intensive.

6. Difference between coalesce() and repartition()? 
- 'coalesce()' reduces the number of partitions without shuffling data, making it efficient when decreasing partitions. 'repartition()' reshuffles data across partitions and can both increase or decrease partition counts.

7. Difference between broadcast() and cache()? 
- 'broadcast()' sends a small dataset to all executors, making it useful for lookups or joins with large datasets. 'cache()' stores a DataFrame or RDD in memory for faster reuse in iterative operations or repeated queries.

8. How to create a new column with a constant value? 
- df.withColumn("new_col", lit("constant_value"))

9. How to sort without inbuilt functions? 
def bubble_sort(arr):
 n = len(arr)
 for i in range(n):
 for j in range(0, n-i-1):
 if arr[j] > arr[j+1]:
 arr[j], arr[j+1] = arr[j+1], arr[j]


10. How to find the smallest number in a list? 
def find_smallest(arr):
 smallest = arr[0]
 for num in arr:
 if num < smallest:
 smallest = num
 return smallest


11. How to find the smallest value in a dictionary? 
def find_smallest_in_dict(d):
 smallest_key = None
 smallest_value = None
 for key, value in d.items():
 if smallest_value is None or value < smallest_value:
 smallest_key = key
 smallest_value = value
 return smallest_key, smallest_value