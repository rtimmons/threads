package Threads::Parser;

# Constructor
sub new {
    my ($invocant, %options) = @_;
    my $class = ref($invocant) || $invocant;
    return bless \%options => $class;
}

sub parse {
    my ($self) = @_;
    # TODO
}


1
