package MyCLI;
use MooseX::App qw(Config Color);
use Mojo::UserAgent;
# Add config file and color-output plugin

has 'global_option' => (
    is            => 'rw',
    isa           => 'Bool',
    documentation => q[Enable this to do fancy stuff],
);

1;

package MyCLI::Add;
use MooseX::App::Command;
extends qw(MyCLI); # optional

parameter 'l_operand' => (
    is                => 'rw',
    isa               => 'Num',
    documentation     => q[left operand value],
    required          => 1,
);

parameter 'r_operand' => (
    is                => 'rw',
    isa               => 'Num',
    documentation     => q[right oprand value],
    required          => 1,
);

sub run {
    my ($self) = @_;
    # Do something
    my $ua  = Mojo::UserAgent->new;
    print "The result is : ". $ua->get('localhost:3000/add?leftoperand='.$self->l_operand.'&rightoperand='.$self->r_operand)->result->body."\n";
}

1;

package MyCLI::Minus;
use MooseX::App::Command;
extends qw(MyCLI); # optional

parameter 'l_operand' => (
    is                => 'rw',
    isa               => 'Num',
    documentation     => q[left operand value],
    required          => 1,
);

parameter 'r_operand' => (
    is                => 'rw',
    isa               => 'Num',
    documentation     => q[right oprand value],
    required          => 1,
);

sub run {
    my ($self) = @_;
    # Do something
    my $ua  = Mojo::UserAgent->new;
    print "The result is : ". $ua->get('localhost:3000/minus?leftoperand='.$self->l_operand.'&rightoperand='.$self->r_operand)->result->body."\n";
}

1;

package MyCLI::Multiply;
use MooseX::App::Command;
extends qw(MyCLI); # optional

parameter 'l_operand' => (
    is                => 'rw',
    isa               => 'Num',
    documentation     => q[left operand value],
    required          => 1,
);

parameter 'r_operand' => (
    is                => 'rw',
    isa               => 'Num',
    documentation     => q[right oprand value],
    required          => 1,
);

sub run {
    my ($self) = @_;
    # Do something
    my $ua  = Mojo::UserAgent->new;
    print "The result is : ". $ua->get('localhost:3000/multiply?leftoperand='.$self->l_operand.'&rightoperand='.$self->r_operand)->result->body."\n";
}

1;

package MyCLI::Divide;
use MooseX::App::Command;
extends qw(MyCLI); # optional

parameter 'l_operand' => (
    is                => 'rw',
    isa               => 'Num',
    documentation     => q[left operand value],
    required          => 1,
);

parameter 'r_operand' => (
    is                => 'rw',
    isa               => 'Num',
    documentation     => q[right oprand value],
    required          => 1,
);

sub run {
    my ($self) = @_;
    # Do something
    my $ua  = Mojo::UserAgent->new;
    print "The result is : ". $ua->get('localhost:3000/divide?leftoperand='.$self->l_operand.'&rightoperand='.$self->r_operand)->result->body."\n";
}

1;

package MyCLI::Factorial;
use MooseX::App::Command;
extends qw(MyCLI); # optional

parameter 'l_operand' => (
    is                => 'rw',
    isa               => 'Num',
    documentation     => q[left operand value],
    required          => 1,
);

sub run {
    my ($self) = @_;
    # Do something
    my $ua  = Mojo::UserAgent->new;
    print "The result is : ". $ua->get('localhost:3000/factorize?leftoperand='.$self->l_operand)->result->body."\n";
}

1;
