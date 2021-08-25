#include <stdio.h>
#include <stdlib.h>

typedef struct
{
  int len;
  int *arr;
} lenArray;

int adj0[] = {0};
int adj1[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
int adj2[] = {0, 2, 3, 5, 6, 8, 9};
int adj3[] = {3, 6, 9};
int adj4[] = {0, 4, 5, 6, 7, 8, 9};
int adj5[] = {0, 5, 6, 8, 9};
int adj6[] = {6, 9};
int adj7[] = {0, 7, 8, 9};
int adj8[] = {0, 8, 9};
int adj9[] = {9};
lenArray adjList[10];

int possibleNums[200];
int possibleNumsAlloc = 0;

void createPossibles(int n)
{
  int i;

  if (n > 200)
    return;

  possibleNums[possibleNumsAlloc++] = n;
  for (i = 0; i < adjList[n % 10].len; i++)
  {
    createPossibles(n * 10 + adjList[n % 10].arr[i]);
  }
}

int comparator(const void *x, const void *y)
{
  return *(int *)x - *(int *)y;
}

int main()
{
  int i;

  // init adjList
  adjList[0].arr = adj0;
  adjList[0].len = 1;
  adjList[1].arr = adj1;
  adjList[1].len = 10;
  adjList[2].arr = adj2;
  adjList[2].len = 7;
  adjList[3].arr = adj3;
  adjList[3].len = 3;
  adjList[4].arr = adj4;
  adjList[4].len = 7;
  adjList[5].arr = adj5;
  adjList[5].len = 5;
  adjList[6].arr = adj6;
  adjList[6].len = 2;
  adjList[7].arr = adj7;
  adjList[7].len = 4;
  adjList[8].arr = adj8;
  adjList[8].len = 3;
  adjList[9].arr = adj9;
  adjList[9].len = 1;

  for (i = 1; i < 10; i++)
  {
    createPossibles(i);
  }
  qsort(possibleNums, possibleNumsAlloc, sizeof(int), comparator);
  return 0;
}