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