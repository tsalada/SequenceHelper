#!raku

use v6;
use Test;
use lib "%*ENV<HOME>/Documents/myRaku/gitHub/SequenceHelper/lib";
use SequenceHelper;

plan 4;

is 0!, 1,   "0! is 1";
is 1!, 1,   "1! is 1";
is 4!, 24,  "4! is 24";
is 5!, 120, "5! is 120";

