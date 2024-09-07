A **generator** in Python is a special type of iterator that allows you to iterate over a sequence of values lazily, meaning that 
it generates values on the fly as needed, rather than computing and storing the entire sequence in memory upfront. This can be more
memory-efficient, especially when dealing with large datasets or infinite sequences.

Generators are defined using a function that contains one or more `yield` statements instead of `return`. When the generator function 
is called, it doesnt execute the function immediately. Instead, it returns a generator object that can be iterated over. Each time 
the `yield` statement is encountered, the functions state is saved, and the next value is returned. When the function is resumed, 
it continues from where it left off.

### Example of a Generator

#### Generator Function

```python
def count_up_to(n):
    """A generator that yields numbers from 1 to n."""
    count = 1
    while count <= n:
        yield count
        count += 1
```

- **How it works:**
    - When `count_up_to(n)` is called, it doesnt run immediately.
    - Instead, the function returns a generator object.
    - Each time `next()` is called on the generator, it will execute the function until it hits the `yield` statement, returns 
      the yielded value, and pauses.
    - When resumed, it will continue from where it left off.

#### Using the Generator

```python
# Create a generator to count up to 5
gen = count_up_to(5)

# Iterate over the generator
for num in gen:
    print(num)
```

**Output:**
```
1
2
3
4
5
```

In this example:
- The `yield` statement pauses the function and returns a value (the current `count`).
- When the function resumes, it continues from the last `yield` statement.

### Generator vs Regular Function
A **regular function** returns a value and terminates. In contrast, a **generator function** can yield multiple values over time, 
resuming execution between each value.
For example, if you wanted to generate a large range of numbers or an infinite sequence, using a generator is more memory-efficient 
than building a list.

### Infinite Generator Example
Heres an example of a generator that produces an **infinite sequence** of numbers:

```python
def infinite_sequence():
    num = 0
    while True:
        yield num
        num += 1
```

```python
# Create an infinite sequence generator
gen = infinite_sequence()

# Print the first 10 numbers from the generator
for _ in range(10):
    print(next(gen))
```

**Output:**
```
0
1
2
3
4
5
6
7
8
9
```

In this example, `infinite_sequence()` will keep yielding numbers forever. This is possible because generators only compute values 
on-demand, allowing for potentially infinite sequences without consuming all available memory.

Generators are ideal for:
- Handling large datasets
- Efficiently processing streams of data
- Working with sequences where the entire dataset doesn't need to be stored in memory