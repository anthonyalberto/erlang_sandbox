-module(recursive).
-compile(export_all).

fac(N) when N == 0 -> 1;
fac(N) when N > 0  -> N*fac(N-1).

len([]) -> 0;
len([_|T]) -> 1+len(T).

tail_fac(N) -> tail_fac(N,1).
tail_fac(0,Acc) -> Acc;
tail_fac(N,Acc) when N > 0 -> tail_fac(N-1,N*Acc).

tail_len(L) -> tail_len(L, 0).
tail_len([], Acc) -> Acc;
tail_len([_|T], Acc) -> tail_len(T, Acc+1).

duplicate(0,_) -> [];
duplicate(N,Term) when N > 0 -> [Term|duplicate(N-1,Term)].

tail_duplicate(N, Term) -> tail_duplicate(N, Term, []).
tail_duplicate(0, _, Acc) -> Acc;
tail_duplicate(N, Term, Acc) when N > 0 -> tail_duplicate(N-1, Term, [Term|Acc]).

reverse([]) -> [];
reverse([H|T]) -> reverse(T)++[H].

tail_reverse(L) -> tail_reverse(L,[]).
tail_reverse([],Acc) -> Acc;
tail_reverse([H|T],Acc) -> tail_reverse(T, [H|Acc]).

sublist(_,0) -> [];
sublist([],_) -> [];
sublist([H|T], N) when N > 0 -> [H|sublist(T, N-1)].

tail_sublist(L, N) -> reverse(tail_sublist(L, N, [])).
tail_sublist([], _, Acc) -> Acc;
tail_sublist(_, 0, Acc) -> Acc;
tail_sublist([H|T], N, Acc) when N > 0 -> tail_sublist(T, N-1, [H|Acc]).

zip(_, []) -> [];
zip([], _) -> [];
zip([X|Xs], [Y|Ys]) -> [{X, Y}|zip(Xs, Ys)].

tail_zip(X, Y) -> tail_zip(X, Y, []).
tail_zip([], _, Acc) -> Acc;
tail_zip(_, [], Acc) -> Acc;
tail_zip([X|Xs], [Y|Ys], Acc) -> tail_zip(Xs, Ys, [{X, Y}|Acc]).


quicksort([]) -> [];
quicksort([Pivot|Rest]) ->
    {Smaller, Larger} = partition(Pivot,Rest,[],[]),
    quicksort(Smaller) ++ [Pivot] ++ quicksort(Larger).

partition(_,[], Smaller, Larger) -> {Smaller, Larger};
partition(Pivot, [H|T], Smaller, Larger) when H =< Pivot ->
    partition(Pivot, T, [H|Smaller], Larger);
partition(Pivot, [H|T], Smaller, Larger) when H > Pivot ->
    partition(Pivot, T, Smaller, [H|Larger]).
