#!raku

use v6;
use Test;
use SequenceHelper;

#is 4! 24;  #Negation metaoperator not followed by valid infix
#is 4!, 24; Cannot negate , because comma operators are not iffy enough

done-testing;
