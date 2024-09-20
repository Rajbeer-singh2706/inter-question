
1. What is driver memory, and when does it spill to disk?
2. How does the memory manager work?
3. When do you get an OOM (Out Of Memory) exception in the driver node and executor node?
4. What is executor memory, how is it distributed, and when does it spill to disk?
5. How do you decide on cluster configuration if you have 100 GB of data?
6. How many types of join strategies are there in Spark?
7. When using Shuffle Sort Merge Join, does the shuffling occur on the driver node or the executor node?
8. Why do we get an Analysis Exception error?
9. What are the different types of Databricks Runtimes?
10. How do you call one notebook from another in Databricks?



𝑴𝒂𝒏𝒚 𝒐𝒇 𝒚𝒐𝒖 𝒉𝒂𝒗𝒆 𝒃𝒆𝒆𝒏 𝒂𝒔𝒌𝒊𝒏𝒈 𝒂𝒃𝒐𝒖𝒕 𝒓𝒆𝒔𝒐𝒖𝒓𝒄𝒆𝒔 𝒇𝒐𝒓 𝒑𝒓𝒆𝒑𝒂𝒓𝒊𝒏𝒈 𝒇𝒐𝒓 𝒂 𝑫𝒂𝒕𝒂 𝑬𝒏𝒈𝒊𝒏𝒆𝒆𝒓𝒊𝒏𝒈 𝒓𝒐𝒍𝒆. 

Here are some commonly asked Spark questions that I encountered in recent interviews.

 1. How many types of join strategies are there in Spark?
 2. When using Shuffle Sort Merge Join, does the shuffling occur on the driver node or the executor node?
 3. What optimization techniques have you used in Spark?
 4. What is a DAG in Spark, and what is its purpose?
 5. If data can be spilled to disk, why do we encounter OOM (Out Of Memory) errors?
 6. How does Spark work internally?
 7. What are the different phases of the SQL Engine?
 8. Why do we get an Analysis Exception error?
 9. Explain in detail the different types of transformations in Spark.
 10. How many partitions are created when we invoke a wide dependency transformation?

 1. If we have two large datasets (approximately 100 GB each) and encounter an Out Of Memory (OOM) exception while performing a join on both, how can we optimize this scenario?
2. What is the difference between `head()` and `take()`?
3. How can array columns be converted to a list of columns in Spark?
4. What is partition pruning, and what are common errors associated with it?
5. How does Adaptive Query Execution (AQE) work in Spark?
6. How does Spark manage storage inside an executor internally?
7. What is the difference between `cache()` and `persist()`? Which one follows lazy evaluation?
8. What is bucket pruning?
9. What should be the cluster configuration to process 100 GB of data?
10. What is salting in Spark, and why is it needed?
 

 1. What are Application, Job, Stage, and Task in Spark, and how are they related? (Explain with an example.)
2. Why do we get an OutOfMemory (OOM) exception when calling `collect()`, but not when calling `take()`?
3. What is an Accumulator variable in Spark and how does it differ from a Broadcast variable?
4. How can we get the row count of each partition in Spark?
5. What are the different performance tuning techniques in Spark?
6. What is a serializer in Spark and how does it work?
7. What is an RDD in Spark? What are its advantages and disadvantages, and when should we use RDDs?
8. What are the different read and write modes in Spark? How can we insert corrupted records into a new table?
9. If we are copying a large dataset from on-premises to the cloud using Azure Data Factory (ADF) and the speed is slow, how can we optimize this process?
10. If there are over 100 tables in a database and you need to copy all of them to the cloud using ADF, how would you design the pipeline?


ere are some commonly asked Spark questions that I encountered in recent interviews.

1. How would you handle a situation where your data is highly skewed, causing certain partitions to be much larger than others?
2. Describe the best practices to optimize join operations in Spark.
3. Explain the difference between DataFrame and Dataset. When would you use one over the other?
4. How would you handle the small file problem when reading data from HDFS or S3?
5. Describe your approach to troubleshoot and resolve a job failure due to executor memory issues.
6. How would you design a pipeline in Databricks for processing incremental data?
7. How would you determine the optimal cluster size for a given Spark job?
8. What techniques would you use to efficiently process and analyze very large datasets in Spark?
9. Explain the security features in Databricks and how you would implement them in a data pipeline.
10. How would you implement data quality checks in a Databricks pipeline?




6.Here are some commonly asked Spark questions that I encountered in recent interviews.

1. What are the different ways to run a notebook from another notebook in Databricks?
2. If you encounter an Out Of Memory (OOM) exception when joining two large datasets, what steps would you take to resolve this issue?
3. Given the following transformations, identify how many jobs, stages, and tasks will be created:
 - Read data from a CSV source
 - Repartition into 2
 - Filter
 - Select
 - GroupBy
 - Collect()
4. Have you worked on Spark optimization in your current project? Explain the issue you faced and how you resolved it.
5. How do you use Kafka in your project? Describe the architecture and the daily pipeline runs.
6. What are the benefits of using Delta tables?
7. What file formats have you worked with, and why is the Parquet format preferable to other file formats?
8. If you have 100 GB of data, how would you choose the cluster configuration?
9. What is the Catalyst optimizer, and explain its phases?
10. Explain memory management in Spark?


Here are some commonly asked Spark questions that I encountered in recent interviews.

1. When we cache data in Spark, where is it stored? In Spark memory or user memory?
2. What are the different ways to parameterize a notebook?
3. What do you understand by driver node and worker node, and how are their responsibilities divided?
4. How do I connect to an Azure SQL Database from Databricks?
5. How do I read and write data to and from Azure Blob Storage?
6. How do I schedule and automate jobs in Azure Databricks?
7. How do I secure my data and access in Databricks?
8. Have you ever worked with JSON data? How do you flatten nested JSON data?
9. How do you handle corrupted data while reading from a source? Provide a code example where you read data from a CSV file 
and store the corrupted records.
10. What methods are you using in your project for incremental load?