-module(guards).
-compile(export_all).

% Important note : can't use user defined functions in guards, because they could introduce side effects.

old_enough(X) when X >= 16 -> true;
old_enough(_) -> false.

% , acts as andalso. Silences exceptions though.
right_age(X) when X >= 16, X =< 104 -> true;
right_age(_) -> false.

% ; acts as orelse. Silences exceptions though.
wrong_age(X) when X < 16; X > 104 -> true;
wrong_age(_) -> false.

% You can also use andalso, orelse. Only way to nest conditionals too like : (A orelse B) andalso C

