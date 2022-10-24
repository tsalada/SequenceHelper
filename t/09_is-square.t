#!raku

use v6;
use Test;
use lib "%*ENV<HOME>/Documents/myRaku/gitHub/SequenceHelper/lib";
use SequenceHelper;

plan 3;

ok is-square(9), "9 is a square";
nok is-square(5), "5 is not a square";

is phi(), 1.618033988749895, "phi is defined correctly";