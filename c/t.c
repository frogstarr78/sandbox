#include <stdio.h>      /* printf(), putchar() */
#include <unistd.h>     /* getlogin() */

//#include "username.c"   /* yyparse() */
#include "cards.c"   /* yyparse() */

int main()
{
	while (yyparse())     /* repeat until EOF */
	;
	return 0;
}
