5 div 2 % integer division
2#101010 % 101010 in base 2 (binary)

% Variables begin with Capital letter
Un = Uno = One = 1.

% Erase content of variable. Only works in shell.
f(Un).

% an atom, similar to symbols in ruby
% Not garbage collected, don't create them from dynamic content.
atom.


true and false.
true or false.
true xor false.
not false.
not (true and true).

% logical ops above always evaluate both sides.
% use andalso , orelse to prevent that.

% equality
4 == 4.0. % true
4 /= 4.0. % true

% true equality
4 =:= 4.0. % false
4 =/= 4.0. % false

% comparisons
1 < 2.
1 > 2.
1 =< 2.
1 >= 2.

% order of types when comparing two different types :
% number < atom < reference < fun < port < pid < tuple < list < bit string
% true and false ar atoms so ...
1000000 < false. % true
0 == false. % false


% Tuples
X = 10, Y =4.
Point = {X,Y}.

% extract tuple value :
Point = {4,5}.
{X,Y} = Point.
X.

% Tuples can be nested :
{point, {X,Y}}.


% Lists can contain anything :
[1, 2, 3, {numbers,[4,5,6]}, 5.34, atom].

% outputs é because there's no such thing as strings
% if all integers are ASCII values in a string, it'll print it as such.
[233].

% Manipulations
[1,2,3] ++ [4,5].
[1,2,3,4,5] -- [1,2,3].

% both are right-associative
[1,2,3] -- [1,2] -- [3]. % => [3]

hd([1,2,3,4]). % head
tl([1,2,3,4]). % tail

% [Head|Tail] matches both
List = [2,3,4].
NewList = [1|List].
[Head|Tail] = NewList.

% | is the constructor (cons) operator.
% [1 | 2] is an improper list. Correct form would be [1 | [2]], or just [1, 2]


% List comprehensions. Quite similar to Haskell, nothing surprising here.
% [Output || Var <- List, filter1, filter2, ...]
% [Expression || Pattern <- List, Condition1, Condition2, ... ConditionN].
[2*N || N <- [1,2,3,4]].
[X || X <- [1,2,3,4,5,6,7,8,9,10], X rem 2 =:= 0].

% extract menu items priced from 3 to 10$
RestaurantMenu = [{steak, 5.99}, {beer, 3.99}, {poutine, 3.50}, {kitten, 20.99}, {water, 0.00}].
[X || {X, Y} <- RestaurantMenu, Y >= 3, Y =< 10].
% with taxes counted in afterwards (7% tax)
[{X, Y * 1.07} || {X, Y} <- RestaurantMenu, Y >= 3, Y =< 10].

% you can have more than one pattern and produce all combinations :
[X+Y || X <- [1,2], Y <- [2,3]].

% Better definition :
% NewList = [Expression || GeneratorExp1, GeneratorExp2, ..., GeneratorExpN, Condition1, Condition2, ... ConditionM].

% Note that the generator expressions coupled with pattern matching also act as a filter:
Weather = [{toronto, rain}, {montreal, storms}, {london, fog}, {paris, sun}, {boston, fog}, {vancouver, snow}, {yo, fog, yeah}].
FoggyPlaces = [X || {X, fog} <- Weather]. % filters out {yo, fog, yeah} without exception because does not match {X, fog} pattern.


% Bit Syntax
Color = 16#F09A29. % Orange CSS color, base 16.
Pixel = <<Color:24>>. % Put color on 24 bits 8 bits for red, green, blue.

% Bit pattern matching
Pixels = <<213,45,132,64,76,32,76,0,0,234,32,15>>. % 4 pixels
<<Pix1:24, Pix2:24, Pix3:24, Pix4:24>> = Pixels. % Extract each pixel into a separate var, each on 24 bits (6 hexa)
<<R:8, G:8, B:8>> = <<Pix1:24>>. % Extract Pixl1's R, G, B on 8 bits each. (2 hexa)
<<R:8, Rest/binary>> = Pixels. % Extract first Pixl R's color and dump all the rest in Rest

% Possible values for matching :
  % Value
  % Value:Size
  % Value/TypeSpecifierList
  % Value:Size/TypeSpecifierList

% By default, uses unsigned ints
<<X1/unsigned>> =  <<-44>>.
X1. % 212
<<X1/signed>> =  <<-44>>.
X1 % -44
<<X2/integer-signed-little>> =  <<-44>>.
X2 % -44

% Bit operations
2#00100 = 2#00010 bsl 1. % shift left
2#00100 = 2#01000 bsr 1. % shift right
2#10101 = 2#10001 bor 2#00101. % or. THere is also band, bxor, bnot

% Example of how to parse a TCP segment
<<SourcePort:16, DestinationPort:16, AckNumber:32, DataOffset:4, _Reserved:4,
Flags:8, WindowSize:16, CheckSum: 16, UrgentPointer:16, Payload/binary>> = SomeBinary.

% Binary comprehension
Pixels = <<213,45,132,64,76,32,76,0,0,234,32,15>>.
RGB = [ {R,G,B} || <<R:8,G:8,B:8>> <= Pixels ]. % Extracts each pixel as tuples
<< <<R:8, G:8, B:8>> ||  {R,G,B} <- RGB >>. % Reconstruct Pixels binary


