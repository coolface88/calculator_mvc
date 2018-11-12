package MyApp;
use Mojo::Base 'Mojolicious';

use MyApp::Model::Calc;

# This method will run once at server start
sub startup {
  my $self = shift;

  # Load configuration from hash returned by "my_app.conf"
  my $config = $self->plugin('Config');

  # Documentation browser under "/perldoc"
  $self->plugin('PODRenderer') if $config->{perldoc};

  # Calc Model
  $self->helper(calc => sub { state $calc = MyApp::Model::Calc->new }); 

  # Router
  my $r = $self->routes;

  # Normal route to controller
  #$r->get('/')->to('example#welcome');
  $r->get('/')->to('CalcController#index');

  # Addition
  $r->get('/add')->to('CalcController#add');

  # Minus
  $r->get('/minus')->to('CalcController#minus');

  # Multiplication
  $r->get('/multiply')->to('CalcController#multiply');
  
  # Division
  $r->get('/divide')->to('CalcController#divide');
  
  # Factorial
  $r->get('/factorize')->to('CalcController#factorize');
}

1;
