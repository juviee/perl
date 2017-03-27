use Data::Dumper;
use strict;


sub refer_recursor{
    #get reference
    #return copy of structure under that reference
    my $arg = shift;

    if(!(ref $arg cmp "ARRAY")){
        my @rtn;
        while(my($k, $v) = each @$arg){
            $rtn[$k] = refer_recursor($v);
        }
        return \@rtn;
    }
    elsif(!(ref $arg cmp "HASH")){
        my %rtn;
        while(my ($k, $v) = each %$arg){
            $rtn{$k} = refer_recursor($v);
        }
        return \%rtn;
    }
    elsif(!(ref $arg cmp "")){#scalar string,num or undef
        return $arg;
    }
    else{
    #ref to a scalar, or ref, or func, for exmpl. i wont print them, gimmi money
        print "undefined behavior\n";

    }

}
my $val = 42;
my $ref = \$val;
my $foo = [
  {
      "a", 1,
      "b", 2
  },
  {
      'c', 3,
      'd', {
          "e", 4,
          "f", undef() 
      }
  },
  "Cockroach pain",
  $ref
];
my $bar = refer_recursor($foo);
print Dumper($bar);
