#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <ctype.h>
#include <string.h>
#define SIZE 6

//int size = 6;
//char *stack[size];
char *stack[SIZE] = {'\0','\0','\0', '\0','\0','\0'};

int Stack_size(char **stack)
{
	return SIZE;
}

int Stack_nitems(char **stack)
{
	int r = 0;
	int i;
	for(i=0; i < Stack_size(stack); i++) {
		if ( stack[i] && stack[i] != '\0' ) {
			r++;
		}
	}
	return r;
}

bool Stack_isempty(char **stack)
{
	return Stack_nitems(stack) == 0;
}

char *Stack_pop(char **stack)
{
	int i;
	char *retrn = stack[0];
	for(i=0; i < Stack_size(stack); i++) {
		stack[i] = stack[i+1];
	}
	return retrn;
}

void Stack_push(char **stack, char *item)
{
	int i;
	for(i=Stack_size(stack); i >= 0; i--) {
		stack[i] = stack[i-1];
	}
	stack[0] = item;
}

//void Stack_peek();

int Stack_index(char **stack, char *item)
{
	int i;
	if ( item == '\0' || Stack_isempty(stack) ) return -1;
	for(i=0; i < Stack_size(stack); i++) {
		if ( stack[i] && strncmp(stack[i], item, sizeof(stack[i])) == 0 ) {
			return i;
		}
	}
	return -1;
}

void Stack_print(char **stack)
{
	int i;
	for(i=0; i < Stack_size(stack); i++) {
		printf("stack[%d] = %s\n", i, stack[i]);
	}
}

int main(int argc, char *argv[])
{

//	char *stack[SIZE] = {'\0','\0','\0','\0', '\0', '\0', '\0'};

	Stack_push(stack, "bob");
	Stack_push(stack, "joe");
	Stack_push(stack, "tom");
	Stack_push(stack, "nel");
	printf("sizeof(stack) = %i\n", sizeof(stack));

	Stack_print(stack);
	printf("%d\n", Stack_size(stack));
	printf("%d\n", Stack_nitems(stack));
	Stack_push(stack, "who");
	Stack_push(stack, "where");
	Stack_print(stack);
	printf("%s is @ %i in stack\n", "who", Stack_index(stack, "who"));
	printf("%s is @ %i in stack\n", "where", Stack_index(stack, "where"));
	printf("%s is @ %i in stack\n", "joe", Stack_index(stack, "joe"));
	printf("%c is @ %i in stack\n", '\0', Stack_index(stack, '\0'));
	printf("%s is @ %i in stack\n", "sam", Stack_index(stack, "sam"));
	printf("pop\n");
	Stack_pop(stack);
	Stack_pop(stack);
	Stack_pop(stack);
	Stack_pop(stack);
	Stack_pop(stack);
	Stack_pop(stack);
	printf("---\n");
	Stack_print(stack);
	printf("%c\n", Stack_isempty(stack) ? 't' : 'f');

	printf("%i\n", Stack_index(stack, "who"));
	Stack_push(stack, "abc");
	Stack_print(stack);
	printf("%s is @ %i in stack\n", "abc", Stack_index(stack, "abc"));
	printf("%s is @ %i in stack\n", "who", Stack_index(stack, "who"));
//	Stack_peek();
	return 0;
}
