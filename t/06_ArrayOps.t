#!raku

use v6;
use Test;
use lib "%*ENV<HOME>/Documents/myRaku/gitHub/SequenceHelper/lib";
use SequenceHelper;
use ListHelper;

plan 10;

is arrayOps(10, -> $n, @a, @ref {@a[$n-1] * @ref[$n+1] * @ref[$n+2]}, seeds => [1], refList => (0, 1, *+* ... *)), '1 2 12 180 7200 748800 204422400 145957593600 272940700032000 1336044726656640000', "A067962: verified by arrayOps using reference list";

is arrayOps(15, -> $n, @ref {@ref[$n] + 1}, refList => construct_list('Fibonacci'), passThru => False), '1 2 2 3 4 6 9 14 22 35 56 90 145 234 378', "A001611: verified using reference list but no passThru";

is arrayOps(11, -> $n, @a {@a[$n-1] + @a[$n-2]}, seeds => <0 1>), '0 1 1 2 3 5 8 13 21 34 55', "A000045: verified by arrayOps using Fibonacci Sequence";

is arrayOps(40, -> $n, @a {floor((49 + ([+] @a[0..$n-1]))/9)}, seeds => <5>.Array), '5 6 6 7 8 9 10 11 12 13 15 16 18 20 22 25 28 31 34 38 42 47 52 58 64 71 79 88 98 109 121 134 149 166 184 205 227 253 281 312', "A120206: verified by arrayOps using seed values  1";

is arrayOps(40, -> $n, @a {floor((49 + ([+] @a[0..$n-1]))/9)}, seeds => [5]), '5 6 6 7 8 9 10 11 12 13 15 16 18 20 22 25 28 31 34 38 42 47 52 58 64 71 79 88 98 109 121 134 149 166 184 205 227 253 281 312', "A120206: verified by arrayOps using seed values 2";

is arrayOps(15, -> $n, @a {(@a[$n-1]*@a[$n-6]) + (@a[$n-2]*@a[$n-7]) + (@a[$n-3]*@a[$n-8] + (@a[$n-4]*@a[$n-9]))}, seeds => <1 1 1 1 1 1 1 1 4>), '1 1 1 1 1 1 1 1 4 7 13 25 49 94 463', "A118334: verified by arrayOps using seed values 3";

is arrayOps(10, -> $n, @a {$n * @a[$n-1] + ($n-5) * @a[$n-2]}, seeds => <0 0 0 0 1>, shiftAway => 3), '0 1 5 31 227 1909 18089 190435 2203319 27772873', "A001910: verified by arrayOps with shiftAway";

is arrayOps(20, -> $n, @a {($n * ($n+1) * (2 * $n**2 + 2 * $n - 1) / 6)}, nBase => 1), '1 11 46 130 295 581 1036 1716 2685 4015 5786 8086 11011 14665 19160 24616 31161 38931 48070 58730', "A006324: verified by arrayOps with nBase = 1";

is arrayOps(15, -> $n, @a {$n! + (@a[$n-1] // 0)}, seeds => [0]), '0 1 3 9 33 153 873 5913 46233 409113 4037913 43954713 522956313 6749977113 93928268313', "A007489: verified by arrayOps";

is arrayOps(15, -> $n {3**$n + 5**$n + 6**$n}, passThru => False), '3 14 70 368 2002 11144 63010 360248 2076802 12050504 70290850 411802328 2421454402 14282991464 84472462690', "A001579: verified, no seed values, refList or passThru";
