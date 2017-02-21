#include <stdio.h>
#include <stdint.h>
#define MASK 0x000Cu
#define SEED 0x000Fu
void shift_lfsr(int *lfsr,int mask)
{
  unsigned int feedback;
  feedback=*lfsr&1;
  *lfsr>>=1;
  if(feedback==1)
    *lfsr^=mask;
  
  
}
void init_lfsr(unsigned int seed,unsigned int *lfsr)
{
  *lfsr=seed;
}

int main(void)
{
  unsigned int lfsr;
  init_lfsr(SEED, &lfsr);

  do{
    shift_lfsr(&lfsr,MASK);
    printf("0x%08x\n",lfsr);
  }while(lfsr!=SEED);

  return 0;
}
