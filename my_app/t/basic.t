use Mojo::Base -strict;

use Test::More;
use Test::Mojo;

my $t = Test::Mojo->new('MyApp');
$t->get_ok('/')
  ->status_is(200);

# Add

$t->get_ok('/add?leftoperand=8&rightoperand=10')
  ->status_is(200)
  ->content_like(qr{18});

$t->get_ok('/add?leftoperand=8&rightoperand=0')
  ->status_is(200)
  ->content_like(qr{8});

$t->get_ok('/add?leftoperand=-8&rightoperand=9')
  ->status_is(200)
  ->content_like(qr{1});

$t->get_ok('/add?leftoperand=87&rightoperand=-9')
  ->status_is(200)
  ->content_like(qr{78});

$t->get_ok('/add?leftoperand=-82&rightoperand=-7')
  ->status_is(200)
  ->content_like(qr{-89});

$t->get_ok('/add?leftoperand=abc&rightoperand=8')
  ->status_is(200)
  ->content_like(qr{Error});

$t->get_ok('/add?leftoperand=9&rightoperand=sdfgdg')
  ->status_is(200)
  ->content_like(qr{Error});

# Minus

$t->get_ok('/minus?leftoperand=8&rightoperand=10')
  ->status_is(200)
  ->content_like(qr{-2});

$t->get_ok('/minus?leftoperand=-8&rightoperand=9')
  ->status_is(200)
  ->content_like(qr{-17});

$t->get_ok('/minus?leftoperand=87&rightoperand=-9')
  ->status_is(200)
  ->content_like(qr{96});

$t->get_ok('/minus?leftoperand=-82&rightoperand=-7')
  ->status_is(200)
  ->content_like(qr{-75});

$t->get_ok('/minus?leftoperand=abc&rightoperand=8')
  ->status_is(200)
  ->content_like(qr{Error});

$t->get_ok('/minus?leftoperand=9&rightoperand=sdfgdg')
  ->status_is(200)
  ->content_like(qr{Error});

# Multiply

$t->get_ok('/multiply?leftoperand=8&rightoperand=10')
  ->status_is(200)
  ->content_like(qr{80});

$t->get_ok('/multiply?leftoperand=-8&rightoperand=9')
  ->status_is(200)
  ->content_like(qr{-72});

$t->get_ok('/multiply?leftoperand=87&rightoperand=-9')
  ->status_is(200)
  ->content_like(qr{-783});

$t->get_ok('/multiply?leftoperand=-82&rightoperand=-7')
  ->status_is(200)
  ->content_like(qr{574});

$t->get_ok('/multiply?leftoperand=abc&rightoperand=8')
  ->status_is(200)
  ->content_like(qr{Error});

$t->get_ok('/multiply?leftoperand=9&rightoperand=sdfgdg')
  ->status_is(200)
  ->content_like(qr{Error});

# Divide

$t->get_ok('/divide?leftoperand=8&rightoperand=10')
  ->status_is(200)
  ->content_like(qr{0.8});

$t->get_ok('/divide?leftoperand=-8&rightoperand=-4')
  ->status_is(200)
  ->content_like(qr{2});

$t->get_ok('/divide?leftoperand=81&rightoperand=-9')
  ->status_is(200)
  ->content_like(qr{-9});

$t->get_ok('/divide?leftoperand=-84&rightoperand=-7')
  ->status_is(200)
  ->content_like(qr{12});

$t->get_ok('/divide?leftoperand=abc&rightoperand=8')
  ->status_is(200)
  ->content_like(qr{Error});

$t->get_ok('/divide?leftoperand=9&rightoperand=sdfgdg')
  ->status_is(200)
  ->content_like(qr{Error});

$t->get_ok('/divide?leftoperand=9&rightoperand=0')
  ->status_is(200)
  ->content_like(qr{Error});

# Factorial

$t->get_ok('/factorize?leftoperand=8')
  ->status_is(200)
  ->content_like(qr{40320});

$t->get_ok('/factorize?leftoperand=9')
  ->status_is(200)
  ->content_like(qr{362880});

$t->get_ok('/factorize?leftoperand=0')
  ->status_is(200)
  ->content_like(qr{1});

$t->get_ok('/factorize?leftoperand=-9')
  ->status_is(200)
  ->content_like(qr{Error});

done_testing();
