#!raku

use v6;
use Test;
use lib "%*ENV<HOME>/Documents/myRaku/gitHub/SequenceHelper/lib";
use SequenceHelper;

plan 6;

# verify use of $k and @a

is loopFunctions(20, -> $n, $k, @a {@a[$k]}, -> @a, @temp {@a.push(floor((19 + ([+] @temp)) / 9))}), '2 2 2 2 3 3 3 4 4 4 5 5 6 7 7 8 9 10 11 12', "A120203 verified";

is loopFunctions(20, -> $n, $k, @a {@a[$k]}, -> @a, @temp {@a.push(floor((19 + ([+] @temp)) / 9))}), '2 2 2 2 3 3 3 4 4 4 5 5 6 7 7 8 9 10 11 12', "A120203 verified";

is loopFunctions(20, -> $n, $k, @a {@a[$k]**2}, -> @a, @temp {@a.push(floor(sqrt([+] @temp)))}, seeds => (1).Array), '1 1 1 1 2 2 3 4 6 8 11 16 22 31 44 62 87 123 174 246', "A067859 verified";

is loopFunctions(20, -> $n, $k, @a {@a[$k]**2}, -> @a, @temp {@a.push(floor(sqrt([+] @temp)))}, seeds => [1]), '1 1 1 1 2 2 3 4 6 8 11 16 22 31 44 62 87 123 174 246', "A067859 verified";

is loopFunctions(10, -> $n, $k, @a {6*$k + 2}, -> @a, @temp {@a.push(([*] @temp))}, toN => False), '1 2 16 224 4480 116480 3727360 141639680 6232145920 311607296000', "A047657 verified";

is loopFunctions(10, -> $n, $k, @a {6*$k + 2}, -> @a, @temp {@a.push(([*] @temp))}), '1 2 16 224 4480 116480 3727360 141639680 6232145920 311607296000', "A047657 verified that :toN defaults to False";

#, " verified";