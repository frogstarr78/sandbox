#include <stdio.h>
#include <stdlib.h>

int main ()
{
	char * pPath;
	pPath = getenv ("PATH");
	if ( pPath != NULL ) {
		printf ("The current path is: %s\n",pPath);
	}

	char * pShell;
	pShell = getenv ("SHELL");
	if ( pShell != NULL ) {
		printf ("The current shell is: %s\n",pShell);
	}
	return 0;
}
