# marblestree

<https://open.kattis.com/problems/marblestree>

## My Thoughts

I'll perform a BFS on each node which contains more than one marble, and deposit all the extras into nodes which have no marbles.

This greedy approach doesn't work. It seems that I need to start on the leaves or something like that.

Note that each marble must be moved to its parent to be moved anywhere else. So I track the leaves, and move the the marbles at the leaf to its parent. If a node has 0 marbles, then I will need to move 1 node down from its parent. To simulate this I can move a negative one up to the parent. The total number of moves is the sum of the absolute values of each move.

For each case I need to maintain
- an array of parents
- an array of number of children
- an array of number of marbles
- a queue of leaves

For each leaf:
1. Remove 1 from parents children count
2. Add number of marbles - 1 to parents marbles
3. Add parent to leaves if 0 children now
4. Return number of moves

### Reflection

When working with tree problems, I should look for ways to traverse without using generic graph traversals.

The key here was to traverse up from the leaves, accumulating marbles and marble debts along the way.

Queues can be implemented with 2 lists.

Perhaps I could have stored the program state in a tuple of IOUArrays.
