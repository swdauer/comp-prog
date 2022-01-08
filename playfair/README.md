# playfair

<https://open.kattis.com/problems/playfair>

## My Thoughts

There isn't a lot of input here so I'm not worried about speed. 

The operations I need on the table are too

- Find an element and return its row and column
- Access an element given its row and column

Since the table is only 5 by 5 I'm not worried about having quick access to a row and column. Thus I'll structure the table as a list of lists.
