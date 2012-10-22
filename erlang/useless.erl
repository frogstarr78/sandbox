-module(useless).
-compile([export_all]).

pivotsort([]) -> [];
pivotsort([Pivot|Rest]) -> 
	{Smaller, Larger} = partition(Pivot, Rest, [],[]),
	pivotsort(Smaller) ++ [Pivot] ++ pivotsort(Larger).

partition(_,[], Smaller, Larger) -> {Smaller, Larger};
partition(Pivot, [H|T], Smaller, Larger) ->
	if H =< Pivot -> partition(Pivot, T, [H|Smaller], Larger);
		H > Pivot -> partition(Pivot, T, Smaller, [H|Larger])
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
	end.

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
