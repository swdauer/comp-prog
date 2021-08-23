#include <stdio.h>
#include <string.h>

#define PEA_SOUP "pea soup"
#define PANCAKES "pancakes"
#define PS_PAN_LENS 8
#define UNSATISFIED "Anywhere is fine I guess\n"
#define FLAG_PEA_SOUP 1      // turn on least significant bit as flag
#define FLAG_PANCAKES 1 << 1 // turn on second to least significant bit as flag

int main()
{
  int n, i;
  scanf(" %d", &n);
  for (i = 0; i < n; i++)
  {
    int k, j;
    char restaurant[101], flags = 0;
    scanf(" %d", &k);
    fgets(restaurant, 101, stdin);
    for (j = 0; j < k; j++)
    {
      char item[101];
      int itemLen;
      fgets(item, 101, stdin);
      itemLen = strlen(item);
      if (item[itemLen - 1] == '\n')
      {
        item[itemLen - 1] = '\0';
        itemLen--;
      }

      if (itemLen == PS_PAN_LENS)
      {
        if (strcmp(item, PEA_SOUP) == 0)
        {
          flags = flags | FLAG_PEA_SOUP;
        }
        else if (strcmp(item, PANCAKES) == 0)
        {
          flags = flags | FLAG_PANCAKES;
        }
      }

      if (flags == (flags | FLAG_PANCAKES | FLAG_PEA_SOUP))
      {
        printf("%s\n", restaurant);
        return 0;
      }
    }
  }
  printf(UNSATISFIED);
  return 0;
}