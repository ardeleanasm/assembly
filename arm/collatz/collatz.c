#include <stdio.h>
int collatz(int number)
{
  int length=0;
  while(number!=1)
    {
      if(number%2==0)
	{
	  number=number/2;
	}
      else
	{
	  number=3*number+1;
	}
      length++;
    }
  return length;
}
int main(void)
{
  int number;
  printf("Number:");
  scanf("%d",&number);
  printf("Length of the Hailstone sequence for %d is %d\n",number,collatz(number));
  return 0;
}
