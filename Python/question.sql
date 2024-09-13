# PYTHON THEORY
'''
    ➞ What are Python lists and how are they different from tuples?
    ➞ How do you create a dictionary in Python and access its values?
    ➞ Explain list comprehension and provide an example.
    ➞ How can you read a CSV file in Python using pandas?
    ➞ What is the difference between loc and iloc in pandas?
    ➞ How do you handle missing data in a pandas DataFrame?
    ➞ Explain the use of the apply() function in pandas.
    ➞ How can you merge/join two DataFrames in pandas?Q) difference b/w merge or join 
    ➞ Describe how to group data in pandas and perform aggregation.
    ➞ What are NumPy arrays and how do they differ from Python lists?
    ➞ How do you perform element-wise operations on NumPy arrays?
    ➞ What is the use of the Matplotlib library in Python? Provide an example of a simple plot.
    ➞ How do you create subplots in Matplotlib?
    ➞ Explain the use of the Seaborn library and provide an example of a categorical plot.
    ➞ What is a lambda function in Python and how is it used?

When practicing these Python questions, try using a small sample dataset like the Iris dataset. It's built into many Python libraries. This helps you see how these functions work with actual data.
'''

# PYTHON PS
'''
## 1. Find the second largest number 
### 2.Group Anagrams
Write a function that takes a list of strings and groups anagrams together.

from collections import defaultdict
def group_anagrams(strs):
    anagrams = defaultdict(list)
    for s in strs:
        sorted_str = ''.join(sorted(s))
        anagrams[sorted_str].append(s)
    return list(anagrams.values())

print(group_anagrams(["eat", "tea", "tan", "ate", "nat", "bat"]))
# [['eat', 'tea', 'ate'], ['tan', 'nat'], ['bat']]
'''



### PYTHON
# 1. Find the Longest Substring Without Repeating Characters
'''
Problem: Given a string, find the length of the longest substring without repeating characters.

Input: "abcabcbb"
Output: 3 (The answer is "abc", with a length of 3.)
Hint: Use a sliding window approach to solve this problem efficiently.
'''

 
### 2. **Implement a Python script that reads a large CSV file in chunks and processes it.**
import pandas as pd

def process_csv_in_chunks(file_path, chunk_size=10000):
    chunk_iter = pd.read_csv(file_path, chunksize=chunk_size)
    
    for chunk in chunk_iter:
        # Process the chunk
        process_chunk(chunk)

def process_chunk(chunk):
    # Example processing: Print the first 5 rows of each chunk
    print(chunk.head())

# Example usage:
# Replace 'large_file.csv' with the path to your large CSV file
file_path = 'large_file.csv'
process_csv_in_chunks(file_path, chunk_size=10000)
