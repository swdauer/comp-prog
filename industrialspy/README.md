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

So now I'll do a method of permuting the string, checking if each permutation is prime, and memoizing the results.
