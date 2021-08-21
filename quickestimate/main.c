#include <stdio.h>
#include <string.h>

int main()
{
  int n, i;
  char num[200];
  scanf(" %d", &n);
  for (i = 0; i < n; i++)
  {
    scanf(" %s", num);
    printf("%lu\n", strlen(num));
  }
  return 0;
}