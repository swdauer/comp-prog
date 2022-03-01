# relocation

## Analysis

When allocating coords from newListArray the runtime is 1m23s. When allocating coords from newArray the runtime is 0.013s.

How fast is allocating the array with newArray and then parsing each number and writing to the array?

- This takes 0.066s

Why is newListArray so much slower than initializing each position individually? I think it is because of the list allocation for the entire data.
