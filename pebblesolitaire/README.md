# pebblesolitaire

<https://open.kattis.com/problems/pebblesolitaire>

## My Thoughts

- If one pebble is ever left, the answer for that test is 1
- I can store each pebble board in 12 bits (I'll use strings for the moment and then change if needed)
- My procedure will be to try every possible board only stopping if I ever reach a board with only 1 pebble
