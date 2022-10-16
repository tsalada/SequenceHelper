#!raku

use v6;
use Test;
use lib "%*ENV<HOME>/Documents/myRaku/gitHub/SequenceHelper/lib";
use SequenceHelper;

plan 3;

is genSeq_IndexOps(5, -> $x {3**$x + 5**$x + 6**$x}), '3 14 70 368 2002', "OEIS:A001579 verified";

is genSeq_IndexOps(5, -> $x {$x * (4 * $x**2 - 1) / 3}), '0 1 10 35 84', "OEIS:A000447 verified";

is genSeq_IndexOps(5, -> $x {2**(2**$x)}), '2 4 16 256 65536', "OEIS:A001146 verified";

#is genSeq_IndexOps(7, -> $x {2**(2**$x)}), '2 14 82 478 2786 16238 94642', "OEIS:A077444 verified";

