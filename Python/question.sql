# I should start asking the Object orienteation , now onwards we wont ask same question 
# Keep changing the question on every interview in every topic 

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

When practicing these Python questions, try using a small sample dataset like the Iris dataset. Its 
built into many Python libraries. This helps you see how these functions work with actual data.
'''


-- #PS1 How to sort without inbuilt functions? 
def bubble_sort(arr):
 n = len(arr)
 for i in range(n):
 for j in range(0, n-i-1):
 if arr[j] > arr[j+1]:
 arr[j], arr[j+1] = arr[j+1], arr[j]


--PS2. How to find the smallest number in a list? 
def find_smallest(arr):
  smallest = arr[0]
  for num in arr:
      if num < smallest:
      smallest = num
  return smallest


--PS3. How to find the smallest value in a dictionary? 
def find_smallest_in_dict(d):
    smallest_key = None
    smallest_value = None
    for key, value in d.items():
        if smallest_value is None or value < smallest_value:
             smallest_key = key
             smallest_value = value
    return smallest_key, smallest_value


--PS4. Find the second largest number

-- PS5. Group Anagrams
-- Write a function that takes a list of strings and groups anagrams together.
-- INPUT    : ["eat", "tea", "tan", "ate", "nat", "bat"]
-- OUTPUT   :  [['eat', 'tea', 'ate'], ['tan', 'nat'], ['bat']]
-- WA Test Case as well 

from collections import defaultdict
def group_anagrams(strs):
    anagrams = defaultdict(list)
    for s in strs:
        sorted_str = ''.join(sorted(s))
        anagrams[sorted_str].append(s)
    return list(anagrams.values())

print(group_anagrams(["eat", "tea", "tan", "ate", "nat", "bat"]))


--PS6. Find the Longest Substring Without Repeating Characters
-- Problem: Given a string, find the length of the longest substring without repeating characters.
-- Input: "abcabcbb"
-- Output: 3 (The answer is "abc", with a length of 3.)
-- Hint: Use a sliding window approach to solve this problem efficiently.

def longest_substring():
   pass 


-- PS7. **Implement a Python script that reads a large CSV file in chunks and processes it.**
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


-- PS8. Write a Python function to reverse a linked list.
class ListNode:
    def __init__(self, value=0, next=None):
        self.value = value
        self.next = next

def reverse_linked_list(head):
    prev = None
    current = head
    while current:
        next_node = current.next  # Store next node
        current.next = prev       # Reverse the current nodes pointer
        prev = current            # Move prev and current one step forward
        current = next_node
    return prev  # New head of the reversed list

# Example usage:
# Creating a linked list: 1 -> 2 -> 3 -> 4
head = ListNode(1)
head.next = ListNode(2)
head.next.next = ListNode(3)
head.next.next.next = ListNode(4)

# Reversing the linked list
reversed_head = reverse_linked_list(head)

# Printing the reversed linked list: 4 -> 3 -> 2 -> 1
current = reversed_head
while current:
    print(current.value, end=" -> " if current.next else "\n")
    current = current.next