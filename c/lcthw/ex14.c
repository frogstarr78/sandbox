#include <stdio.h>
#include <ctype.h>
#include <string.h>

int can_print_it(char ch);
void print_letters(char arg[]);

void print_arguments(char *argv[])
{
	int i;
	for( i=0; i < strlen(*argv); i++){
		print_letters(argv[i]);
	}
}

void print_letters(char arg[])
{
	int i;

	for( i=0; arg[i] != '\0'; i++){
			char ch = arg[i];

			if( isalpha(ch) || isblank(ch) ) {
				printf("'%c' == %d ", ch, ch);	
			}
	}

	printf("\n");
}

int main( int argc, char *argv[] )
{
	print_arguments(argv);
	return 0;
}
