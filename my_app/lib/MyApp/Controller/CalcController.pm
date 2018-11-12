package MyApp::Controller::CalcController;
use Mojo::Base 'Mojolicious::Controller';

sub index {
  my $self = shift;
  $self->reply->static('index.html');
}

sub add {
  my $self = shift;
  my $l_operand = $self->param('leftoperand') || '';
  my $r_operand = $self->param('rightoperand') || '';
  my $result =  $self->calc->add($l_operand, $r_operand);
  $self->render(text => $result);
}

sub minus {
  my $self = shift;
  my $l_operand = $self->param('leftoperand') || '';
  my $r_operand = $self->param('rightoperand') || '';
  my $result =  $self->calc->minus($l_operand, $r_operand);
  $self->render(text => $result);
}

sub multiply {
  my $self = shift;
  my $l_operand = $self->param('leftoperand') || '';
  my $r_operand = $self->param('rightoperand') || '';
  my $result =  $self->calc->multiply($l_operand, $r_operand);
  $self->render(text => $result);
}

sub divide {
  my $self = shift;
  my $l_operand = $self->param('leftoperand') || '';
  my $r_operand = $self->param('rightoperand') || '';
  my $result =  $self->calc->divide($l_operand, $r_operand);
  $self->render(text => $result);
}

sub factorize {
  my $self = shift;
  my $l_operand = $self->param('leftoperand') || '';
  my $r_operand = $self->param('rightoperand') || '';
  my $result =  $self->calc->factorize($l_operand);
  $self->render(text => $result);
}

1;
