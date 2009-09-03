-module(new_fib).

%-compile(export_all).
-export(
	[
		lcm/2,
    gcd/2,
    fib/0
	]
).

%lcm(C) -> C.
lcm(A, B) -> A * B.

%gcd(A, B) -> 
%    (A * B) / lcm( A, B).

%function gcd(a, b) if b = 0 return a else return gcd(b, a mod b)

gcd(A, B) when B > 0 -> 
    gcd(B, A rem B);
gcd(A, 0) -> A.



fib(A, B) when B < 6765 andalso A rem 2 == 1 andalso B rem 2 == 1 -> 
  NextTerm = A + B,
	io:format(" ~w", [NextTerm]),
  fib(B, NextTerm);
fib(A, B) when B < 6765 andalso B rem 2 == 0 orelse A rem 2 == 0 -> 
  fib(B, A + B);
%fib(0, 1) -> 1;
%fib(1, 1) -> 2;
%fib(1, 2) -> 3;
%fib(2, 3) -> 5;
%fib(3, 5) -> 8;
%fib(5, 8) -> 13;
%fib(8, 13) -> 21;
%fib(13, 21) -> 34;
%fib(21, 34) -> 55;
%fib(A, 6765) -> A.
fib(_A, _B) when _B >= 6765 -> 
	io:format(".").

fib() ->
	io:format("0"),
  fib(0, 1).
