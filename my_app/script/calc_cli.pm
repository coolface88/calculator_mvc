#!/usr/bin/env perl
package calc;
use strict;
use warnings;
use feature qw( say );
use Getopt::Long qw( GetOptionsFromArray );
use Pod::Usage;
use Regexp::Grammars;
use v5.10;
use Data::Dumper;

sub main {

say "*************** CALCULATOR ***************";
say "*                                        *";
say "*                                        *";
say "*                                        *";
say "*                                        *";
say "*                                        *";
say "*                                        *";
say "*                                        *";
say "*                                        *";
say "*                                        *";
say "************************** ***************";


my $num_args = scalar @ARGV;

if($num_args != 1){
    say "Usage: ./calc_cli.pm file_name\n";

}

my $calculator = do{
    use Regexp::Grammars;
    qr{
        <grammar>

        <objrule: grammar>
          <MATCH=ADD> | <MATCH=MIN> | <MATCH=MULTIPLY> | <MATCH=DIVIDE> | <MATCH=DIVIDE> | <MATCH=FACTORIAL> |<error: Expected ADD, MIN, MULTIPLY, DIVIDE or FACTORIAL>

        <objrule: ADD>
            ^ADD:\s? ( <[Y=Literal]> , )* <X=Literal> $

        <objrule: MIN>
            ^MIN:\s? ( <[Y=Literal]> , )* <X=Literal> $

        <objrule: MULTIPLY>
            ^MULTIPLY:\s? ( <[Y=Literal]> , )* <X=Literal> $

        <objrule: DIVIDE>
            ^DIVIDE:\s? ( <[Y=Literal]> , )* <X=Literal> $

        <objrule: FACTORIAL>
            ^FACTORIAL:\s? ( <[Y=Literal]> , )* <X=Literal> $

        <objtoken: Literal>
            <value=( \d+ )>
    }xms
};


while (my $input = <STDIN>) {
    chomp($input);
    my $debug = $input =~ s{^show \s+}{}xms;

    if ($input =~ /$calculator/ ) {

            my $val = $/{grammar}->eval();
            say $val;

    } else{
        say "Failure on '$input'; Invalid syntax or unknown command.";
    }
    close (ASM);
}


    return 0;
}

sub ADD::eval{
    my ($self) = @_;
    my $x = $self->{X}->eval();
    my $y = $self->{Y};
    my $sum = 0;
    $sum+=$x;
    foreach my $a (@$y) {
        my $val = $a->eval();
        $sum += $val;

    }

    return "ADD $sum";
}


exit main( \@ARGV ) if ( !caller(0) );

1;
