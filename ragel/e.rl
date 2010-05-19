%%{

	machine Example;

	action dgt      { printf("DGT: %c\n", fc); }
	action dec      { printf("DEC: .\n"); }
	action exp      { printf("EXP: %c\n", fc); }
	action exp_sign { printf("SGN: %c\n", fc); }
	action number   { /*NUMBER*/ }

	number = (
		[0-9]+ $dgt ( '.' @dec [0-9]+ $dgt )?
		( [eE] ( [+\-] $exp_sign )? [0-9]+ $exp )?
	) %number;

	main := ( number '\n' )*;

}%%

%% write init;
%% write data;
