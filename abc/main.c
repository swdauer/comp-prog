#include <stdio.h>

#define MAX(X, Y) ((X) > (Y) ? (X) : (Y))

void swap(int *x, int *y)
{
  int hold = *x;
  *x = *y;
  *y = hold;
}

int main()
{
  int a, b, c, i;
  char order[4];
  scanf(" %d %d %d", &a, &b, &c);
  if (MAX(a, b) == a)
  {
    swap(&a, &b);
  }
  if (MAX(b, c) == b)
  {
    swap(&b, &c);
    if (MAX(a, b) == a)
    {
      swap(&a, &b);
    }
  }

  scanf(" %3s", order);

  for (i = 0; i < 3; i++)
  {
    switch (order[i])
    {
    case 'A':
      printf("%d", a);
      break;
    case 'B':
      printf("%d", b);
      break;
    default:
      printf("%d", c);
    }
    if (i != 2)
      printf(" ");
  }
  printf("\n");
  return 0;
}