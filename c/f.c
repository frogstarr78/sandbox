#include <stdlib.h>
#include <stdio.h> 
#include <sys/types.h>
#include <ctype.h>

#if defined HAVE_UINTPTR_T && 0
typedef uintptr_t VALUE;
typedef uintptr_t ID;
# define SIGNED_VALUE intptr_t
# define SIZEOF_VALUE SIZEOF_UINTPTR_T
# undef PRI_VALUE_PREFIX
#elif SIZEOF_LONG == SIZEOF_VOIDP
typedef unsigned long VALUE;
typedef unsigned long ID;
# define SIGNED_VALUE long
# define SIZEOF_VALUE SIZEOF_LONG
# define PRI_VALUE_PREFIX "l"
#elif SIZEOF_LONG_LONG == SIZEOF_VOIDP
typedef unsigned LONG_LONG VALUE;
typedef unsigned LONG_LONG ID;
# define SIGNED_VALUE LONG_LONG
# define LONG_LONG_VALUE 1
# define SIZEOF_VALUE SIZEOF_LONG_LONG
# define PRI_VALUE_PREFIX "ll"
#else
# error ---->> ruby requires sizeof(void*) == sizeof(long) to be compiled. <<----
#endif

static VALUE function( VALUE abc ) 
{
	ID bt;

	putchar( bt );
	putchar( abc );
}

int main()
{
	puts( "Hello, World!" );
	function( 23 );
	return 0;
} 
