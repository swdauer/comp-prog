#include <stdio.h>

#define PEA_SOUP "pea soup"
#define PANCAKES "pancakes"
#define UNSATISFIED "Anywhere is fine I guess\n"
#define HAS_PEA_SOUP(X) ((X) | 1)        // turn on least significant bit as flag
#define HAS_PANCAKES(X) ((X) | (1 << 1)) // turn on second to least significant bit as flag

int main()
{
  char test = 0;
  printf("%u %u\n", HAS_PANCAKES(test), HAS_PEA_SOUP(test));
  return 0;
}