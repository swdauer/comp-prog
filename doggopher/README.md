# doggopher

<https://open.kattis.com/problems/doggopher>

## My Thoughts

Given the coordinates of the dog and the gopher, I need to determine if there is a hole which has euclidean distance from the dog greater than or equal to 2 times the euclidean distance from the gopher. If this is true than the gopher can escape through that hole.

What this is equivalent to is if the square of the distance from the dog to hole is greater than or equal to 4 times the square of the distance from the gopher to the whole.

Thus if the dog position is `(xd, yd)`, the gopher position is `(xg, yg)`, and the hole position is `(xh, yh)`; the gopher can escape if

`4 * ((xg - xh)^2 + (yg - yh)^2) >= (xd - xh)^2 + (yd - yh)^2`

I'll also read the numbers in as integers instead of floating point. Otherwise the equal case might not calculate properly. I can account for this by effectively multiplying each coordinate by 1000.
