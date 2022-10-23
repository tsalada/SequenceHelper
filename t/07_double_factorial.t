#!raku

use v6;
use Test;
use lib "%*ENV<HOME>/Documents/myRaku/gitHub/SequenceHelper/lib";
use SequenceHelper;

plan 4;

is (-1)!!, 1,  '-1!! = 1';
is 0!!, 1,   '0!!  = 1';
is 5!!, 15,  '5!!  = 15';
is 15!!, 2027025, '15!! = 2027025';

