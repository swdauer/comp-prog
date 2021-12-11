# bank

<https://open.kattis.com/problems/bank>

## My Thoughts

If I proceed backwards from the end of the day, I think I can take the greedy approach of just taking the max amount of money at each step.

I'll maintain a current time (starts at T-1) and a list of customers sorted by amount of money decreasing.

I'll iterate and at each iteration I'll take the first element of the list whose time is >= to the current time. Once the current time is -1 I return the total.
