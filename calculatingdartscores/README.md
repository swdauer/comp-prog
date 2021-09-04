# calculatingdartscores

<https://open.kattis.com/problems/calculatingdartscores>

## My Thoughts

- I'll generate all possible darts by adding a dart to my list of possible scores until I've added 3 darts

1. Find all possible scores a dart can get
2. Create an array of size 181 which contains lists of darts
	- This array represents each score from 0 to 180
	- If a spot is filled, that score is possible
	- If a spot is not filled, that score is not possible
3. Initialize zero to possible and all others impossible
4. Add a dart to the array using possible scores and the array
	- Complexity is length(possible scores) * length(array)
5. Repeat (4) until three darts have been added
6. Index the array

- Complexity of the previous procedure is roughly \[length(possible scores) * length(array)\]^3 since step (4) happens three times
- Then that means it's better to just search through the possible scores list three times

1. Find all possible scores a dart can get
2. Check if the score we want is in the possible scores or the sum of any two elements or the sum of any three elements. Each of these sums should include the combo of an element with itself.

- I think I'm wrong with my complexity analysis here. In my new procedure I'm still generating all possible scores and I'm doing it with some extra added since I'm not accounting for duplicates.
