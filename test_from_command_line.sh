#!/bin/bash

# Verify version
raku -e 'use lib "lib"; use SequenceHelper; say ver()';

# Verify factorial operator
raku -e 'use lib "lib"; use SequenceHelper; say 42!';

# Verify double factorial operator
raku -e 'use lib "lib"; use SequenceHelper; say 5!!';

# Generate a sequence using genSeq_IndexOps
raku -e 'use lib "lib"; use SequenceHelper; say genSeq_IndexOps(5, -> $x {3**$x + 5**$x + 6**$x})';

# Generate a sequence using genSeq_ArrayOps
raku -e 'use lib "lib"; use SequenceHelper; say genSeq_ArrayOps(11, -> $x, @z {@z[$x-1] + @z[$x-2]}, <0 1>)';

#Verify Palindrome detector
raku -e 'use lib "lib"; use SequenceHelper; say is-palindrome("noon")';