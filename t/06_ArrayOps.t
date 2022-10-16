#!raku

use v6;
use Test;
use lib "%*ENV<HOME>/Documents/myRaku/gitHub/SequenceHelper/lib";
use SequenceHelper;
use Math::Primesieve;

plan 4;

is genSeq_ArrayOps(11, -> $x, @z {@z[$x-1] + @z[$x-2]}, <0 1>), '0 1 1 2 3 5 8 13 21 34 55', "OEIS:A000045 (Fibonacci Sequence) verified";

is genSeq_ArrayOps(40, -> $x, @z {floor((49 + ([+] @z[0..$x-1]))/9)}, <5>.Array), '5 6 6 7 8 9 10 11 12 13 15 16 18 20 22 25 28 31 34 38 42 47 52 58 64 71 79 88 98 109 121 134 149 166 184 205 227 253 281 312', "OEIS:A120206 verified";

is genSeq_ArrayOps(25, -> $x, @z {(@z[$x-1]*@z[$x-6]) + (@z[$x-2]*@z[$x-7]) + (@z[$x-3]*@z[$x-8] + (@z[$x-4]*@z[$x-9]))}, <1 1 1 1 1 1 1 1 4>), '1 1 1 1 1 1 1 1 4 7 13 25 49 94 463 3691 51649 1342825 67140874 6378379789 2959568174113 10926725697533971 564365382277563803725 757844508822251885989584694 50882343436271211095738004051924943', "OEIS:A118334 verified";

my $ps = Math::Primesieve.new;
my @primes = $ps.n-primes(20);
is genSeq_IndexOps(20, -> $x, @in {@in[$x] * ([+] @in[0..$x])}, @primes), '4 15 50 119 308 533 986 1463 2300 3741 4960 7289 9758 12083 15416 20193 25960 30561 38056 45369', "OEIS:A143215 verified";
