package MyApp::Model::Calc;

use strict;
use warnings;
use Math::BigInt;
use Try::Tiny;
use Scalar::Util qw(looks_like_number);

sub new { bless {}, shift }

sub add {
  my ($self, $l_operand, $r_operand) = @_;
  if (looks_like_number($l_operand) && looks_like_number($r_operand)) {
  # Success
    return $l_operand + $r_operand ;
  }
  return 'Error';

}

sub minus {
  my ($self, $l_operand, $r_operand) = @_;
  # Success
  if (looks_like_number($l_operand) && looks_like_number($r_operand)) {
  # Success
    return $l_operand - $r_operand ;
  }
  return 'Error';
}

sub multiply {
  my ($self, $l_operand, $r_operand) = @_;
  # Success
  if (looks_like_number($l_operand) && looks_like_number($r_operand)) {
  # Success
    return $l_operand * $r_operand ;
  }
  return 'Error';
}

sub divide {
  my ($self, $l_operand, $r_operand) = @_;
  # Success

  if (looks_like_number($l_operand) && looks_like_number($r_operand)) {
  # Success
    return $l_operand / $r_operand ;
  }
  return 'Error';
}

sub factorize {
  my ($self, $l_operand) = @_;

  $l_operand = shift;
  my $n = Math::BigInt->new(shift);
  if ($n < 0) {
    return 'Error';
  }

  my $fact = 1;
  for( my $i = 1; $i <= $n ; $i=$i+1 ){
    $fact = $fact*$i;
  }
  return $fact;
}


1;
