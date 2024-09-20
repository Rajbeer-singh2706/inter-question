# ### 1. **Given an array of integers, find the pair of elements that sum up to a specific target.**
# Example usage:
nums = [2, 7, 11, 15]
target = 9
print(find_pair_with_sum(nums, target))  # Output: (0, 1) -> nums[0] + nums[1] = 2 + 7 = 9



def find_pair_with_sum(nums, target):
    for element in nums: 
        
