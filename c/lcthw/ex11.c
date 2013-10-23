#include <stdio.h>

int main( int argc, char *argv[] )
{
	int i = argc-1;
	while( 0 < i ) {
		printf("arg %d: %s\n", i, argv[i]);
		i--;
	}

	// let's make our own array of strings
	char *states[] = {
		"California", "Oregon",
		"Washington", "Texas"
	};

	int num_states = argc;
	for( i = 0; i < num_states; i++) {
		printf("id %x %s\n", *states[i], states[i]);
		states[i] = argv[i];
		printf("id %x %s\n", *states[i], states[i]);
//		printf("state %d: %s\n", i, states[i]);
	}

	for( i = 0; i < num_states; i++) {
		printf("state %d: %s\n", i, states[i]);
	}

	return 0;
}
