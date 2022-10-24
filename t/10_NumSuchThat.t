#!raku

use v6;
use Test;
use lib "%*ENV<HOME>/Documents/myRaku/gitHub/SequenceHelper/lib";
use SequenceHelper;

plan 1;

is genSeq_NumSuchThat(7, -> $n {is-square(2 * $n**2 + 8)}), '2 14 82 478 2786 16238 94642', "A077444: verified";

