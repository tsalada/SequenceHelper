#!raku

use v6;
use Test;
use SequenceHelper;

plan 1;

# OEIS:000045: Fibonacci numbers
is genSeq_ArrayOps(11, -> $x, @z {@z[$x-1] + @z[$x-2]}, <0 1>), '0 1 1 2 3 5 8 13 21 34 55';

