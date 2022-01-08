# polygonarea

<https://open.kattis.com/problems/polygonarea>

## My Thoughts

I'll use the polygon area formula with determinants. If the area is negative then the points are clockwise, otherwise the points are counter-clockwise.

The idea of the formula is that it's `1/2 * [sum(det([Pi,Pi+1)) where i in 0 to n-2) + det([Pn-1,P1])]`
