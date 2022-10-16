#!raku

use v6;
use Test;
use lib "%*ENV<HOME>/Documents/myRaku/gitHub/SequenceHelper/lib";
use SequenceHelper;

plan 1;

is verSequenceHelper(), "v0.0.1", "Version verified";

