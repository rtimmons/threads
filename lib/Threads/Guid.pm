package Threads::Guid;

use strict;
use warnings;

use overload '""' => 'string';

use Exporter;
our @EXPORT_OK = qw/guid/;

# Constructor
sub new {
    my ($invocant, $length) = @_;
    my $class = ref($invocant) || $invocant;
    $length ||= 20;
    my $self = guid($length);
    return bless \$self => $class;
}

sub string {
    my ($self) = @_;
    return $$self;
}

my @elts = qw(
    0 1 2 3 4 5 6 7 8 9 A B C D E F
    G H J K M N P Q R S T U W X Y Z
);

sub guid {
    my $length = shift || 20;
    my $pid = $$;
    
    my @out = ();
    for( 0 .. $length ) {
        # 13 is an arbitrary prime number
        # 
        # xor in the pid since two instances running at same time
        # might get the same result from rand()
        my $rand = rand( scalar(@elts) * 13 ^ $pid ) % scalar(@elts);
        $out[$_] = $elts[ $rand ];
    }
    join '', @out;
}

if ( $0  eq __FILE__ ) {
    my $g = guid(50);
    print "Guid [$g]\n";
}

1