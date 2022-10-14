#!raku

use v6;
use Test;
use SequenceHelper;

plan 3;

# OEIS:A001579
is genSeq_IndexOps(5, -> $x {3**$x + 5**$x + 6**$x}), '3 14 70 368 2002';

# OEIS:A000447
is genSeq_IndexOps(5, -> $x {$x * (4 * $x**2 - 1) / 3}), '0 1 10 35 84';

# OEIS:A001146
is genSeq_IndexOps(5, -> $x {2**(2**$x)}), '2 4 16 256 65536';

