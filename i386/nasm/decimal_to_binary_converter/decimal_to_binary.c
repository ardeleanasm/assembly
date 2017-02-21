#include <stdio.h>
#include <stdlib.h>
#define LENGTH 32
int decimal_to_binary(int number);

int main(void)
{
  int number;
  printf("The decimal number is:");
  scanf("%d",&number);
  return decimal_to_binary(number);
  
}

int decimal_to_binary(int number)
{
  int *binary;
  binary=(int *)calloc(LENGTH,sizeof(int));
  if(!binary)
    {
      printf("Could not allocate memory for binary array!\n");
      return -1;
    }
  int i=0;
  while(number!=0)
    {
      binary[i++]=number%2;
      number=number/2;
    }
  printf("The binary number is:\n");
  for(i=31;i>=0;i--)
    printf("%d",binary[i]);
  free(binary);
  return 0;
}
