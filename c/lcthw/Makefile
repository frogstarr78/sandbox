example_files = ex1 ex2 ex3 ex4 ex5 ex6 ex7 ex8 ex9
example_files = ex10 ex11 ex13 ex14 ex15 ex16 ex17
CFLAGS = -Wall -g

all: $(example_files) stack
	
clean:
	rm -f $(example_files) stack

$(example_files): ex% : ex%.c
#	$(CC) -c $(CFLAGS) $? -o $@
	$(CC) $(CFLAGS) $? -o $@

stack: stack.c
	$(CC) $(CFLAGS) $? -o $@
