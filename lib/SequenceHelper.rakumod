use v6.d;

module SequenceHelper {

  sub ver() is export {
    return "v0.0.1";
  }

  # Define factorial operator
  #
  sub postfix:<!> ($n) is export {
    when $n == 0 {return 1}
    default {$n * ($n - 1)!}
  }

  # Define double factorial operator
  #
  sub postfix:<!!>($n) is export {
    when $n == 0 | 1 {return 1}
    default {return $n*($n-2)!!}
  }

  sub is-palindrome (Str $p) is export {
    return $p.Str eq $p.Str.flip;
  }

  # -----------------------------------------------------------------
  # Generate sequences that can be built from operations on the
  # index variable. Invoker must supply the function, f, to be
  # applied in each iteration.
  # -----------------------------------------------------------------
  #
  sub genSeq_IndexOps($limit, $f) is export {
    my @a = ();
    for (0...^$limit) -> $n {
      @a.push($f($n));
    }
    return @a;
  }

  # -----------------------------------------------------------------
  # Generate sequences that can be built from operations on previous
  # values in the sequence. Invoker must supply the function, f, to
  # be applied in each iteration.
  # -----------------------------------------------------------------
  #
  sub genSeq_ArrayOps (Int $limit, $f, @seeds) is export {
    my @a = @seeds;
    my $i = @seeds.elems;
    for ($i...^$limit) -> $n {
      @a.push($f($n, @a));
    }
    return @a;
  }

}
