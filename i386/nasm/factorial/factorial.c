#include <stdio.h>
int main(void)
{
  int number,result=1,counter=1;
  
  printf("Enter the number:");
  scanf("%d",&number);
  
  for(;counter<=number;counter++)
    {
      result=result*counter;
    }
  printf("%d!=%d\n",number,result);
  return 0;

}
