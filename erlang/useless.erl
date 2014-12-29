-module(useless).
-compile(export_all).
 
add(A,B) ->
	A + B.
 
%% Shows greetings.
%% io:format/1 is the standard function used to output text.
hello() ->
	io:format("Hello, world!~n").
 
greet_and_add_two(X) ->
	hello(),
	add(X,2).

greet(male, Name) ->
	io:format("Hello, Mr. ~s!", [Name]);
greet(female, Name) ->
	io:format("Hello, Mrs. ~s!", [Name]);
greet(_, Name) ->
	io:format("Hello, ~s!", [Name]).

pivotsort([]) -> [];
pivotsort([Pivot|Rest]) -> 
	{Smaller, Larger} = partition(Pivot, Rest, [],[]),
	pivotsort(Smaller) ++ [Pivot] ++ pivotsort(Larger).

partition(_,[], Smaller, Larger) -> {Smaller, Larger};
partition(Pivot, [H|T], Smaller, Larger) ->
	if H =< Pivot -> partition(Pivot, T, [H|Smaller], Larger);
		H > Pivot -> partition(Pivot, T, Smaller, [H|Larger])
	end.

second([_,S|_]) -> S.
same(X,X) ->
	true;
same(_,_) ->
	false.

head([]) -> [];
head([H|_]) -> H.

rest([]) -> [];
rest([_|T]) -> T.

foot([F]) -> F;
foot([_|T]) -> foot(T).

filter2(Pred, L) -> filter2(Pred, L, []).
filter2(_, [], Acc) -> Acc;
filter2(Pred, L, Acc) -> filter_sub(Pred, Pred(head(L)), L, Acc).

filter_sub(Pred, true,  L, Acc) -> filter2(Pred, rest(L), [head(L)|Acc]);
filter_sub(Pred, false, L, Acc) -> filter2(Pred, rest(L), Acc).

%% find the maximum of a list
max([H|T]) -> max2(T, H).

max2([], Max) -> Max;
max2([H|T], Max) when H > Max -> max2(T, H);
max2([_|T], Max) -> max2(T, Max).

%% find the minimum of a list
min([H|T]) -> min2(T,H).

min2([], Min) -> Min;
min2([H|T], Min) when H < Min -> min2(T,H);
min2([_|T], Min) -> min2(T, Min).

%% sum of all the elements of a list
sum(L) -> sum(L,0).
sum([], Sum) -> Sum;
sum([H|T], Sum) -> sum(T, H+Sum).

fold(_, Init, []) -> Init.
fold(Pred, Init, [H|T]) -> fold(Pred, Pred(H, Init), T).

valid_time({Date = {Y,M,D}, Time = {H,Min,S}}) ->
	io:format("The Date tuple (~p) says today is: ~p/~p/~p,~n",[Date,Y,M,D]),
	io:format("The time tuple (~p) indicates: ~p:~p:~p.~n", [Time,H,Min,S]);
valid_time(_) ->
	io:format("Stop feeding me wrong data!~n").

old_enough(X) when X >= 16 -> true;
old_enough(_) -> false.

right_age(X) when is_integer(X) >= 16 andalso is_integer(X) =< 104 ->
	true;
right_age(_) ->
	false.

wrong_age(X) when is_integer(X) < 16 orelse is_integer(X) > 104 ->
	true;
wrong_age(_) ->
	false.

%heh_fine() ->
%	if 1 =:= 1 ->
%			works
%	end,
%	if 1 =:= 2; 1 =:= 1 ->
%			works
%	end,
%	if 1 =:= 2, 1 =:= 1 ->
%			fails
%	end.

oh_no(N) ->
	if N =:= 2 -> maybe;
		true -> ok
	end.

insert(X,[]) ->
	[X];
insert(X,Set) ->
	case lists:member(X,Set) of
		true  -> Set;
		false -> [X|Set]
	end.

even(L) -> lists:reverse(even(L,[])).
even([], Acc) -> Acc;
even([H|T], Acc) when H rem 2 == 0 -> 
	even(T, [H|Acc]);
even([_|T], Acc) -> 
	even(T, Acc).

even2(L) -> [H || H <- L, H rem 2 == 0].

old_men(L) -> lists:reverse(old_men(L, [])).
old_men([], Acc) -> Acc;
old_men([Person = {male, Age}|People], Acc) when Age > 60 ->
	old_men(People, [Person|Acc]);
old_men([_|People], Acc) ->
	old_men(People, Acc).

filter(Pred, L) -> lists:reverse(filter(Pred, L, [])).
filter(_, [], Acc) -> Acc;
filter(Pred, [H|T], Acc) -> 
	case Pred(H) of
		true -> filter(Pred, T, [H|Acc]);
		false -> filter(Pred, T, Acc)
%insert2(X,Set) when not lists:member(X,Set) ->
%	[X|Set];
%insert2(_,Set) ->
%	Set.


insert3(X,Set) ->
	insert3(lists:member(X,Set), X, Set).

insert3(_,X,[]) ->
	[X];
insert3(false,X,Set) ->
	[X|Set];
insert3(true,_,Set) ->
	Set.

fac(0) -> 1;
fac(N) -> N*fac(N-1).

len([]) -> 0;
len([_|R]) -> 1 + len(R).

fac2(N) -> fac2(N,1).
fac2(0,Acc) -> Acc;
fac2(N,Acc) -> fac2(N-1,N*Acc).

len2(L) -> len2(L,0).
len2([],Acc) -> Acc;
len2([_|R],Acc) -> len2(R,Acc+1).

duplicates(C,T) when C > 0 -> duplicates(C,T,[]).
duplicates(0,_,Acc) -> Acc;
duplicates(C,T,Acc) -> duplicates(C-1,T,[T|Acc]).

sublist(_,0) -> [];
sublist([],_) -> [];
sublist([H|T],N) when N > 0 -> [H|sublist(T,N-1)].

%sublist2([],0) -> [];
%sublist2([H|T],N) when N > 0 -> [sublist2([H],N-1)|T].

tail_sublist(L, N) -> tail_sublist(L, N, []).
 
tail_sublist(_, 0, SubList) -> SubList;
tail_sublist([], _, SubList) -> SubList;
tail_sublist([H|T], N, SubList) when N > 0 ->
	tail_sublist(T, N-1, [H|SubList]).
