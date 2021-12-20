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
