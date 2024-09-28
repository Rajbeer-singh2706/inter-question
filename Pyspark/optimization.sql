Spark Job Optimization Techniques 🚀 

1. Use Broadcast Join : When joining a small dataset with a large one, broadcast the smaller dataset to avoid shuffling. 
Broadcasting ensures the smaller dataset is available on each node locally.

2. Cache and persist: Use cache() and persist() to store intermediate results of RDDs, DataFrames, or Datasets. This avoids 
recomputation and enhances performance in subsequent actions.

3. Enabel Adaptive Query Execution(AQE): AQE dynamically adjusts query plans based on runtime statistics, helping to optimize skewed 
data, change join strategies, and improve the overall performance of Spark jobs.

4. Repartition and Coalesce: Use repartition() to increase or decrease partitions and coalesce() to efficiently reduce partitions 
without triggering full shuffling.

5. Minimize data shuffling: Avoid wide transformations like groupBy() and join() that require shuffling data across nodes or using 
reduceByKey over groupByKey where required. Use narrow transformations, partitioning, and broadcast variables to reduce shuffling 
and improve performance. 

6. Filter Pushdown: Apply filters as early as possible to reduce the data size before joins and aggregations. The Catalyst Optimizer 
in Spark handles this efficiently for DataFrames and Datasets.

7. Avoid Inferschema: Instead of using InferSchema when reading files, define a custom schema using StructType. This improves 
performance by avoiding costly metadata extraction.

8. Salting Technique: If there arent enough distinct keys to create partitions, try salting to increase the number of partitions 
and improve parallelism.

9. Choose the correct file format : Opt for file formats like Parquet, ORC, or Avro for better compression, columnar storage, 
and schema evolution, improving both storage and performance.

10. Tune Spark Configuration: Optimize Spark configuration settings for memory management, such as 
 1. spark.executor.memory,
 2. spark.memory.fraction, and 
 3. shuffle partitions (spark.sql.shuffle.partitions), to improve job performance and avoid memory and data spill issues.


Can you explain Pyspark Optimizations? Here is a detailed document on this.

#PersistingandCaching
Persisting (or caching) intermediate data can avoid recomputing it across multiple actions or stages.
 By storing data in memory (or on disk if needed), Spark can quickly access frequently used data without recalculating, 
 which significantly improves performance, especially for iterative algorithms like machine learning.

from pyspark import StorageLevel
df.persist(StorageLevel.MEMORY_AND_DISK)

hashtag#Partitioning
Optimizing data partitioning can greatly enhance performance. Techniques like using repartition to increase the number of partitions for parallelism or coalesce to reduce partitions to avoid shuffling can help balance workload and minimize overhead. Proper partitioning ensures that data is evenly distributed across the cluster, reducing skew and preventing any one node from becoming a bottleneck.

# Repartitioning DataFrame to 10 partitions based on a column
df_repartitioned = df.repartition(10, "column_name")


hashtag#BroadcastVariable
Broadcast variables allow the distribution of a read-only variable to all nodes in the cluster, which can be more efficient than shipping the variable with every task. This is particularly useful for small lookup tables.

# Broadcasting a variable
broadcastVar = sc.broadcast([1, 2, 3])

hashtag#SkewHandling
Data skew occurs when some partitions have significantly more data than others, leading to an imbalance in workload. Spark optimizes skew handling by detecting skewed data and redistributing it more evenly or by using techniques like skewed join optimization, where it partitions skewed data differently to balance the load across nodes.