-module(tut).
-export([
	double/1, 
	fac/1, 
	mult/2, 
	convert/2, 
	convert_length/1,
	list_length/1,
	join_file_path/1
]).

double(X) -> 2 * X.

fac(1) -> 1;
fac(N) -> N * fac(N - 1).

mult(X, Y) -> X * Y.

convert(M, inch) -> M/2.54;
convert(N, centimeter) -> N*2.54.

convert_length({centimeter,P})->{ inch, P/2.54};
convert_length({inch, Z})->{centimeter,Z*2.54}.

list_length([]) -> 0;
list_length([First | Rest]) -> 1 + list_length(Rest).


% works
%join_file_path(List) -> 
%	join_file_path(List, []).
%join_file_path(List, File_path) -> 
%	lists:concat(lists:flatmap(fun(X)->['/', X] end, List)).

join_file_path(List) -> 
	join_file_path([], List).
join_file_path(File_path, []) -> File_path;
join_file_path(File_path, [Head | Rest]) -> 
	join_file_path(lists:concat([File_path, '/', Head]), Rest).
