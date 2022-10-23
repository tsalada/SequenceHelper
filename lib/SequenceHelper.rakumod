use v6.d;

module SequenceHelper {

  sub verSequenceHelper() is export {
    return "v0.0.3";
  }

  #|Define the Golden Ration: phi
  sub phi() is export {
    return (1 + sqrt(5))/2;
  }

  #|Define a factorial operator: '!'
  sub postfix:<!>(Int $n) is export {
    when $n == 0|1 {return 1}
    default {return $n * ($n - 1)!}
  }

  #|Define a double factorial operator: '!!'
  sub postfix:<!!>($n) is export {
    when $n == -1|0|1 {return 1}
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

  #|( Generate sequences that can be built from computations
      involving computations on the value of the index variable and/or
      previous values in the sequence. Invoker must supply the function,
      f, to be applied in each iteration and a list of seed values.
  )
  sub arrayOps (Int $limit, $f, :@seeds, :@refList, Int :$nBase = 0, Int :$shiftAway = 0, Bool :$passThru = True) is export {
    my @a = (@seeds // ());
    my $nStart = @seeds.elems + $nBase;
    my $nLast = $limit + $nBase + $shiftAway;
    for ($nStart...^$nLast) -> $n {
      if (@refList // False) {
        if ($passThru) {
          @a.push($f($n, @a, @refList));
        }
        else {
          @a.push($f($n, @refList));
        }
      }
      else {
        if ($passThru) {
          @a.push($f($n, @a));
        }
        else {
          @a.push($f($n));
        }
      }
    }
    if ($shiftAway) {
      for (0..^$shiftAway) {
        @a.shift;
      }
    }
    return @a;
  }

  #|( Generate sequences based on finding numbers meet a user specified
     criterion; such as being prime. Invoker must supply the function
     that defines that criterion.
  )
  multi sub genSeq_NumSuchThat($limit, $f) is export {
    return (0, 1 ...*).grep({$f($^x)})[^$limit];
  }

  #|( Generate sequences based on finding numbers meet a user specified
     criterion; such as being prime. Invoker must supply the function
     that defines that criterion and, in this version, a reference list
     the function will access.
  )
  multi sub genSeq_NumSuchThat($limit, $f, @refList) is export {
    return (0, 1 ...*).grep({$f($^n, @refList)})[^$limit];
  }

  sub loopFunctions($limit, $f_inLoop, $f_afterLoop, Int :$shiftAway = 0, Bool :$toN = False, :@seeds) is export {
    my @a = @seeds // ();
    my $nStart = @a.elems;
    my $nLast = $shiftAway ?? $limit + $nStart !! $limit;
    my @temp = ();

    for ($nStart...^$nLast) -> $n {

      if ($toN) {
        @temp = ();
        for (0...(@a.elems)) -> $k {
          @temp.push($f_inLoop($n, $k, @a));
        }
        $f_afterLoop(@a, @temp);
        @temp = ();
      }
      else {
        for (0...^(@a.elems)) -> $k {
          @temp.push($f_inLoop($n, $k, @a));
        }
        $f_afterLoop(@a, @temp);
        @temp = ();
      }
    }
    if ($shiftAway) {
      for (0..^$shiftAway) {
        @a.shift;
      }
    }
    return @a;
  }

}
