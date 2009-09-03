-module(multi_server1).

-compile(export_all).

start() -> register(multi, spawn(fun() -> loop() end)).

loop() ->
    receive
        {email, From, Subject, Text} = Email ->
            {ok, S} = file:open("inbox", [append,write]),
            io:format(S, "~p.~n",[Email]),
            file:close(S);
        {msg, From, Message} -> 
            io:format("msg (~s) ~s~n", [From, Message])
    end,
loop().
