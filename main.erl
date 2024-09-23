-module(main).
-export([start/0]).

start() ->
    input().

input() ->
    Input = io:get_line("Enter phase to encrypt: "),
    I = list_to_tuple(Input),
    if
        I == {10} ->
            io:format("Cannot encrypt blank input ~n"),
            input();
        true ->
            X = encryption(I),
            Y = decryption(X),
            {X, Y}
    end.

encryption(Input) ->
    L = tuple_to_list(Input),
    lists:map(fun(X) -> 1 + X end, L).

decryption(L) ->
    lists:map(fun(X) -> X - 1 end, L).
