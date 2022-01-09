# incognito

<https://open.kattis.com/problems/incognito>

## My Thoughts

The total number of disguises is the product of (the number of items in each category + 1) - 1. The plus one is for the case of not wearing any items from that category. The minus one is for the case where no items are worn as this case is not valid.

My procedure is to read each item in a case, store the total number in each category, and then carry out the product. At each case I'll store the running totals in a list of (String, Int) and perform a linear search to find an item.
