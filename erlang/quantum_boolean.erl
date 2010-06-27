-module(quantum_boolean).
-export([qand/2, qnot/1, fanout/1, toffoli/3, toffoli2/3]).

%AND ::= 1 if INPUT_X == 1 && INPUT_Y == 1
%AND ::= 0 if INPUT_X == 0 || INPUT_Y == 0

qand(1, 1) -> 1;
qand(X, 0) -> 0;
qand(0, Y) -> 0;
qand(X, Y) -> 
	[X, Y].

qnot(1) -> 0;
qnot(0) -> 1;
qnot(X) -> X.

fanout(X) -> 
	[X, X].

toffoli(1, 1, 0) -> [1, 1, 1];
toffoli(1, 1, 1) -> [1, 1, 0];
toffoli(X, Y, 0) -> [X, Y, 0];
toffoli(X, Y, 1) -> [X, Y, 1];
toffoli(X, Y, Z) -> [X, Y, Z].

toffoli2(X, Y, 0) -> [X, Y, qand(X, Y)];
toffoli2(X, 1, 0) -> [First, Next] = fanout(X),
                     [First, 1, Next];
toffoli2(1, 1, Z) -> [1, 1, qnot(Z)];
toffoli2(X, Y, Z) -> [X, Y, Z].
