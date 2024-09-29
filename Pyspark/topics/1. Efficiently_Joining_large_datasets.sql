-- Title: Efficiently Joining Large Datasets (1TB+) in PySpark
 
When dealing with big data, optimizing join operations is important, especially when working with massive datasets. 
Recently, I had to join two datasets, each over 1TB in size, using PySpark, and it was crucial to ensure that this process was 
done efficiently to avoid memory bottlenecks or shuffling issues.

The Setup:
- customers_df (1TB): Contains customer details.
- transactions_df (1TB): Contains transaction records.

Our goal was to join these datasets based on the customer_id in an efficient manner.
Key Optimizations:
-- 1. Repartitioning on Join Keys:

Since both datasets were large, the first step was to repartition them based on the join key (customer_id). 
This ensures that rows with the same key end up in the same partition, minimizing shuffle.

# Repartition both datasets by 'customer_id'
customers_df = customers_df.repartition(200, "customer_id")
transactions_df = transactions_df.repartition(200, "customer_id")

# Perform the join operation
result_df = customers_df.join(transactions_df, "customer_id")

-- ########## 2. Handling Data Skew ############
 If the customer_id is skewed (some customers have significantly more records than others), this can cause certain partitions to 
 become overloaded. To mitigate this, I applied a salt to the join key. This ensures that skewed keys are evenly distributed 
 across partitions.

-- # Add a salt column to distribute skewed keys
customers_df = customers_df.withColumn("salt", F.rand(seed=42))
transactions_df = transactions_df.withColumn("salt", F.rand(seed=42))

-- # Join on both customer_id and salt
result_df = customers_df.join(transactions_df, ["customer_id", "salt"])

--- ########## 3. Optimizing Partition Size:
 Managing partition sizes is critical for large data operations. I adjusted the number of partitions to ensure they were neither too 
 small nor too large. Ideally, partitions should be around 128MB-256MB to achieve a good balance of memory usage and parallelism.

-- # Repartition to optimize for performance
customers_df = customers_df.repartition(400)
transactions_df = transactions_df.repartition(400)
result_df = customers_df.join(transactions_df, "customer_id")

-- 4. Caching for Repeated Access:
 If the resulting joined dataset is needed for multiple transformations or actions, caching it in memory saves the overhead of 
 recomputation, leading to faster downstream processing.

-- # Cache the result for reuse
result_df.cache()
result_df.count()  # Trigger an action to materialize the cache

By implementing these optimizations, I was able to efficiently join 2TB of data in PySpark without encountering shuffle overloads 
or memory issues.
Takeaway:
When working with large datasets, always consider repartitioning on join keys, managing data skew, and optimizing partition sizes 
to achieve the best performance!

-- Suggestion1
Best way are bucketing for large dataframes joining. Will do bucketing on the same columns for both of the dataframe and will add 
also the column in joining condition. Shuffling will not happen and it will be efficient
-- Suggestion2
yes bucketing will help here to avoid the shuffling. Also it is very effective for wide transformation because it makes sure data 
is colocated in executors.

-- Suggestion3
The extra operations like repartitioning or adding a salt key arent just arbitrary steps—they actually help reduce computational 
overhead in the long run.Bucketing could also be a good option here as many people have suggested. Bucketing distributes data 
based on a hash of the column.
I dont have the exact run times at the moment, but generally, these optimizations help to avoid expensive shuffles between partitions and processing delays, which significantly improves overall execution time when dealing with large datasets (1TB+ in this case).