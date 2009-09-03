-module(fib).
-export(
	[
%		fib/2,
		fib/1,
		even_fib/1,
		sumer/0
%		fib/3
	]
).

%fib(First, Last) when First >= 4000000 
%                 orelse Last >= 4000000 ->
%	First;
%fib(First, Last) when First < 4000000 
%                 andalso Last < 4000000 ->
%	fib(Last, First+Last).

fib(Max) -> 
	io:format("1"),
	fib(0,1,Max).
fib(First, Last, Max) when First >= Max ->
	ok;
fib(First, Last, Max) when First < Max ->
	NextTerm = First+Last,
	io:format(" ~w", [Last]),
	fib(Last, NextTerm, Max).	

even_fib(Max) ->
  io:format("1"),
  even_fib(0,1,Max).
even_fib(First, Last, Max) when First rem 2 == 1 ->
  0;
even_fib(First, Last, Max) when First rem 2 == 0 ->
  fib(First, Last, Max).

%even_sum() ->
%  Total = 0,
%  receive
%    ok ->
%	  Total;
%	{fib, Num} ->
%	  Total+Num;
%  end.

sumer() -> 
  Evens = [],
  receive
	  done ->
	    lists:sum(Evens);
	  {fib, N} ->
		  if 
			N rem 2 == 0 ->
			  lists:append(Evens, [N]);
			true ->
			  0
		  end
  end
.
%even_sum(Num) when Num rem 2 == 0 ->
%  Total = 0,
%  receive
%    
%  end.
  
%even_fibs(Max) ->
%	lists:append([], fib(Max)).
