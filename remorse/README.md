# remorse

<https://open.kattis.com/problems/remorse>

## My Thoughts

I think the greedy approach works here. The idea is to assign the letter which occurs most frequently the shortest sequence (one dot), then the letter which occurs next the second shortest sequence, and so on.

There is also an addition of 3 between each pair of letters. So (numLetters-1)*3

1. Read in the sentence
2. Maintain a list of the number of occurrences of each letter
3. Sort the list descending
4. Create a list of the length of each morse character sorted ascending
5. Zip the lists
6. At each element, multiply to get length
7. Add in spaces between each letter
