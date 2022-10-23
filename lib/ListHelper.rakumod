use v6.d;

module ListHelper {

  my %list_constructor = ();
  %list_constructor{'A000045'} = (0, 1, *+* ... *);
  %list_constructor{'Fibonacci'} = (0, 1, *+* ... *);
  %list_constructor{'A000032'} = (2, 1, {$^a + $^b} ... *);
  %list_constructor{'Lucas'} = (2, 1, {$^a + $^b} ... *);

  sub construct_list (Str $name) is export {
    return %list_constructor{$name};
  }
  #sub construct_list_2 (Str $name, $limiter) is export {
  #  return -> (0, 1, *+* ... * $limiter);
  #}
}