-module(m). 
-export([
	fact/1,
	is_greater_than/2,
	mod_of_three_and_five/1,
	less_than_one_thousand/1,
	is_mod_and_less/1
]). 

fact(N) when N>0 -> 
	N * fact(N-1); 
fact(0) -> 1.


is_greater_than(X, Y) ->
	if X>Y ->
		true;
	true ->
		false
	end
.

mod_of_three_and_five(X) ->
	if X rem 3 == 0 orelse X rem 5 == 0 ->
		true;
	true ->
		false
	end
.

less_than_one_thousand(X) when X < 1000 -> true;
less_than_one_thousand(X) -> false.

is_mod_and_less(X) when X rem 3 == 0 orelse X rem 5 == 0 andalso X < 1000 -> X;
is_mod_and_less(X) -> 0.

%Answer:
%lists:sum(lists:map(fun(X) -> m:is_mod_and_less(X) end, lists:seq(0,1000))).
% 233168

%66> io:format("~8.8.0B~.0n", [9]).  
%00000011
%ok
%67> io:format("~8.8.0B~.0n", [3]).
%00000003
%ok
%68> io:format("~8.8.2B~.0n", [3]). 
%22222223
%ok
%69> io:format("~8.2B~.0n", [3]).  
%      11
%ok
%70> io:format("~8.2B~.0n", [6]).
%     110
%ok
%71> io:format("~8.2B~.0n", [9]).
%    1001
%ok
%72> io:format("~8.2B~.0n", [12]).
%    1100
%ok
%73> io:format("~8.2B~.0n", [15]).
%    1111
%ok
%74> io:format("~8.2B~.0n", [18]).
%   10010
%ok
%75> io:format("~8.2B~.0n", [21]). 
%   10101
%ok
%76> io:format("~8.2B~.0n", [24]).
%   11000
%ok
%77> io:format("~8.2B~.0n", [999]).
%********
%ok
%78> io:format("~.2B~.0n", [999]). 
%1111100111
%ok
%79> io:format("~10.2B~.0n", [999]).
%1111100111
%ok
%80> io:format("~10.2B~.0n", [3]).  
%        11
%ok
%81> io:format("~10.2B~.0n", [9]).
%      1001

%3+9^2+15^6
%3+36+960

%io:format("~18.2B~.0n", [233168]).
%111000111011010000

%io:format("~10.2B~.0n", [999]).
%        1111100111
%io:format("~18.2B~.0n", [995]).   
%        1111100011
%io:format("~18.2B~.0n", [990]).
%        1111011110

%111000111011010000 % 233168
%        1111100111 % 999
%        1111100011 % 995
%        1111011110 % 990

%333*(3+999)/2 + 199*(5+995)/2 - 66*(15 + 990)/2.
%333*(3+999)/2.                           
%166833.0
% io:format("~18.2B~n", [166833]).
%101000101110110001
%round(199*(5+995)/2).              
% 99500
% io:format("~18.2B~n", [99500]).    
% 11000010010101100
%round(66*(15 + 990)/2).
%33165
%124> io:format("~18.2B~n", [33165]).
%  1000000110001101

%111000111011010000 % 233168
%101000101110110001 % 166833
%011000010010101100 % 99500
%===========================
%111000111110111101 
%001000000110001101 % 33165


%111000111010010000
%111000111011010000 % 233168

%101000101110110001 % 166833
%011000010010101100 % 99500
%001000000110001101 % 33165
%111000111010010000 % 233104


%101000101110110001 %125> io:format("~18.2B~n", [166833]).   
%011000010010101100 %126> io:format("~18.2B~n", [99500]). 
%001000000110001101 %127> io:format("~18.2B~n", [33165]). 
%111000111010010000

