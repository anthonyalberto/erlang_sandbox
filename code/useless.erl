-module(useless).
% declared module name

% Define which functions will be exported
% -export([Function1/Arity, Function2/Arity, ..., FunctionN/Arity]).
-export([add/2, hello/0, greet_and_add_two/1]).

% Optionally import functions so you don't have to prefix them. Using it considered bad practice.
% -import(Module, [Function1/Arity, ..., FunctionN/Arity]).

% Define macro. Use it by calling ?MACRO
% -define(MACRO, some_value).
% Example for a function :
% -define(sub(X,Y), X-Y). Call it with ?sub(23,47)

add(A,B) ->
    A + B.

%% io:format/1 is the standard function used to output text.
hello() ->
    io:format("Hello, world!~n").

greet_and_add_two(X) ->
    hello(),
    add(X,2).


% Compile it from erlang shell :
% cd("/path/to/where/you/saved/the-module/").
% c(useless).

% Compile to native code (yields ~20% perf improvement)
% hipe:c(useless)

% Extract metadata in shell after compilation
% useless:module_info().
