# industrialspy

<https://open.kattis.com/problems/industrialspy>

## My Thoughts

1. Construct a sieve of eratosthenes
2. Iterate over the cases
    1. For each case, iterate over the sieve
        - Check if the current num is constructable
            - If so, add 1 to the count
    2. Return the total number of constructable primes
3. Print all the cases' answers

Looks like this approach is too long, unless there is a way to speed up my sieving process

There is by using an iterating integer to remove elements instead of checking mod each time.

Even with the improved sieve method it's still too slow.

### Attempt 2

So now I'll do a method of permuting the string, checking if each permutation is prime, and memoizing the results.

1. Iterate over cases
    1. Generate permutations
    2. Iterate of permutations
        1. Check if permutation is prime
        2. If it is, add one to count
    3. Add count to output
2. Output list of counts

I'll need to memoize which numbers are prime.

I'll check if a number is prime by iterating up to the square root of the number.

Using an array with incremental updates as my memoization structure is slow. Try using a different structure.

Perhaps accumArray, perhaps Data.Map.Strict. Switching to Data.Array.IO

My solution was accepted but it is the slowest haskell solution for this problem. I could speed it up by refactoring and by changing the array type I'm using.
