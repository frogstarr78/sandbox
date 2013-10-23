#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
//#include <string.h>

//int size = 10;
//char *stack[size];

//void Stack_pop();
//void Stack_push(char *item[])
//{
//	*(stack++) = item;
//}
//void Stack_peek();
//int Stack_size()
//{
//	int r = 0;
//	int i = 0;
//	for(i; i < size; i++) {
//		if ( stack[i] ) r++
//	}
//	return r;
//}
//
//bool Stack_isempty()
//{
//	return Stack_size(stack) == 0;
//}
//

#define SIZE 4

void Stack_print(char *stack)
{

	int i;
	for(i=0; i < SIZE; i++) {
		printf("stack[%d] = %s\n", i, stack);
	}
}


int main(int argc, char *argv[])
{

	char *stack[SIZE];

	int i = 0;
	stack[i] = "bob";
	i++;
	stack[i] = "joe";
	i++;
	stack[i] = "tom";
	i++;
	stack[i] = "ner";

//	for(i=0; i < SIZE; i++) {
//		printf("stack[%d] = %s\n", i, stack[i]);
//	}
	Stack_print(*stack);
//	Stack_push(, "abc");
//	Stack_push(, "xyz");
//	Stack_push(, "pdq");
//	Stack_push(, "lmno");
//	Stack_peek();
//	printf("stack size %d", Stack_size());
	return 0;
}
