#!raku

use v6;
use Test;
use lib "%*ENV<HOME>/Documents/myRaku/gitHub/SequenceHelper/lib";
use SequenceHelper;

plan 3;

ok is-palindrome("noon"), "'noon' is palindromic";
ok is-palindrome("121"),  "'121' is palindromic";
ok is-palindrome(2552.Str),  "2552 is palindromic";