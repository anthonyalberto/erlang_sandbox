% Pattern matching
% Function clauses are ended by a ;
greet(male, Name) ->
    io:format("Hello, Mr. ~s!", [Name]);
greet(female, Name) ->
    io:format("Hello, Mrs. ~s!", [Name]);
greet(_, Name) ->
    io:format("Hello, ~s!", [Name]).

% see functions.erl
% see guards.erl
% see what_the_if.erl

% When to use function + guards vs case vs if?
% cases should be used when there's only one argument to guard against
% functions + guards can be used when there is more than one argument to guard against
% if => use it for very simple stuff where having the whole pattern matching syntax is overkill
