#include <stdio.h>
#include <ctype.h>

int main(int argc, char *argv[])
{
  char buf[1024];
  int msize= 1024;
  int a= 0;
  
  while (fgets(buf, 1023, stdin))
    {
      if (isxdigit(buf[0]))
	{
	  int i, ok= 1;
	  for (i=0; i<8; i++)
	    ok= ok && isxdigit(buf[i]);
	  if (ok)
	    {
	      buf[8]= 0;
	      printf("%s\n", buf);
	      a++;
	    }
	}
    }
  for ( ; a < msize; a++)
    printf("00000000\n");    
}
