# marblestree

<https://open.kattis.com/problems/marblestree>

## My Thoughts

I'll perform a BFS on each node which contains more than one marble, and deposit all the extras into nodes which have no marbles.

This greedy approach doesn't work. It seems that I need to start on the leaves or something like that.
