use v6.d;

module SequenceHelper {

  sub verSequenceHelper() is export {
    return "v0.0.2";
  }

  #|Define the Golden Ration: phi
  sub phi() is export {
    return (1 + sqrt(5))/2;
  }

  #|Define a factorial operator: '!'
  sub postfix:<!>(Int $n) is export {
    when $n == 0|1 {return 1}
    default {$n * ($n - 1)!}
  }

  #|Define a double factorial operator: '!!'
  sub postfix:<!!>($n) is export {
    when $n == 0 | 1 {return 1}
    default {return $n*($n-2)!!}
  }

  #|Detects palindromes, returns a Boolean
  sub is-palindrome (Str $p) is export {
    return $p.Str eq $p.Str.flip;
  }

  #|Test for being a square number
  sub is-square($n) is export {
    return $n == floor(sqrt($n)) ** 2 ?? True !! False;
  }

  #|( Generate sequences from operations on the loop index variable
      Invoker must supply the function, f, to be executed in each
      iteration.
  )
  multi sub genSeq_IndexOps($limit, $f) is export {
    my @a = ();
    for (0...^$limit) -> $n {
      @a.push($f($n));
    }
    return @a;
  }

  #|( Generate sequences from operations on the loop index variable
      Invoker must supply the function, f, to be executed in each
      iteration and an input list for the loop index variable
      to use.
  )
  multi sub genSeq_IndexOps($limit, $f, @in) is export {
    my @a = ();
    for (0...^$limit) -> $n {
      @a.push($f($n, @in));
    }
    return @a;
  }

  #|( Generate sequences that can be built from operations on previous
     values in the sequence. Invoker must supply the function, f, to
     be applied in each iteration and a list of seed values.
  )
  sub genSeq_ArrayOps (Int $limit, $f, @seeds) is export {
    my @a = @seeds;
    my $i = @seeds.elems;
    for ($i...^$limit) -> $n {
      @a.push($f($n, @a));
    }
    return @a;
  }

  #|( Generate sequences based on finding numbers meet a user specified
     criterion; such as being prime. Invoker must supply the function
     that defines that criterion.
  )
  sub genSeq_NumSuchThat($limit, $f) is export {
    return (0, 1 ...*).grep({$f($^x)})[^$limit];
  }
}
