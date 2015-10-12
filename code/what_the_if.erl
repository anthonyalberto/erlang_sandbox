-module(what_the_if).
-export([heh_fine/0, oh_god/1, help_me/1]).


heh_fine() ->
    if 1 =:= 1 ->
        works
    end,
    if 1 =:= 2; 1 =:= 1 ->
        works
    end,
    if 1 =:= 2, 1 =:= 1 -> % Will always be false, therefore makes the function unusable
        fails
    end.

oh_god(N) ->
    if N =:= 2 -> might_succeed;
        true -> always_does  %% this is Erlang's if's 'else!'
    end.

%% note, this one would be better as a pattern match in function heads!
%% I'm doing it this way for the sake of the example.
help_me(Animal) ->
    Talk = if Animal == cat  -> "meow";
              Animal == beef -> "mooo";
              Animal == dog  -> "bark";
              Animal == tree -> "bark";
              true -> "fgdadfgna"
           end,
    {Animal, "says " ++ Talk ++ "!"}.

% Logic as to why `true` is better than `else` is a bit messed up.
% `true` is actually just a cheap way to get `else` working.
% Explanation is that they'd rather list all possible eventualities rather than have a catch-all `else`
% That's fine when comparing 2 ints as there's only 3 possible outcomes but what if you have
% an enum with 10 possible values and only care for 2 of them?
% I guess you'd pattern match and have a catch-all anyway.
% So I don't see why an `else` shouldn't be appropriate.
