#include<stdio.h>
int n,first,second,next;
void fibonacci()
{
  int c;
  for(c=0;c<n;c++)
    {
      if(c<=1)
	next=c;
      else
	{
	  next=first+second;
	  first=second;
	  second=next;
	}
      printf("%d\n",next);
    }
} 
int main()
{
  printf("Enter the number of terms\n");
  scanf("%d",&n);
  fibonacci();
  return 0;
}
