# pebblesolitaire

<https://open.kattis.com/problems/pebblesolitaire>

## My Thoughts

- If one pebble is ever left, the answer for that test is 1
- I can store each pebble board in 12 bits (I'll use strings for the moment and then change if needed)
- My procedure will be to try every possible board only stopping if I ever reach a board with only 1 pebble

1. Read in number of cases
2. Repeat for each board
	1. Read in board
	2. Add board to fringe, a list of boards
	3. If head fringe pebble count == 1 add 1 to output and continue at super-step 2
	4. If minimum pebble count > head fringe pebble count then update minimum
	5. Find descendants of the board and add them to fringe
	6. Repeat 3-5
	7. Add minimum to output
3. Print output
