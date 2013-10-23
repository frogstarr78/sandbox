#include <stdio.h>

int main( int argc, char *argv[] )
{
	if( argc < 2 ) {
		printf("Error: You need at least one arg.\n");
		// this is how you abort a program 
		return 1;
	}

	int i, j;
	for( j = 0; j < argc; j++) {
		for( i = 0; argv[j][i] != '\0'; i++ ) {
			char letter = argv[j][i];

			switch(letter) {
				case 'a':
				case 'A':
					printf("%d: 'A'\n", i);
					break;
				case 'e':
				case 'E':
					printf("%d: 'E'\n", i);
					break;
				case 'i':
				case 'I':
					printf("%d: 'I'\n", i);
					break;
				case 'o':
				case 'O':
					printf("%d: 'O'\n", i);
					break;
				case 'u':
				case 'U':
					printf("%d: 'U'\n", i);
					break;
				case 'y':
				case 'Y':
					if( i > 2 ) {
						// sometimes
						printf("%d: 'Y'\n", i);
					} else {
						printf("%d: %c is not a vowel.\n", i, letter);
					}
					break;
				default:
					printf("%d: %c is not a vowel.\n", i, letter);
			}
		}
	}

	return 0;
}
