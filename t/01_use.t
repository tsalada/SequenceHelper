#!raku

use v6;
use Test;
use Test::META;
use lib "%*ENV<HOME>/Documents/myRaku/gitHub/SequenceHelper/lib";

plan 3;

use-ok('SequenceHelper', 'Can load "SequenceHelper"');
use-ok('ListHelper', 'Can load "ListHelper"');

constant AUTHOR = ?%*ENV<AUTHOR_TESTING>;

if AUTHOR {
    require Test::META <&meta-ok>;
    meta-ok;
    done-testing;
}
else {
     skip-rest "Skipping author test";
     exit;
}
