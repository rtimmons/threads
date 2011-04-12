package Threads::Message;

use Threads::Guid qw(guid);

# Constructor
sub new {
    my ($invocant, %options) = @_;
    my $class = ref($invocant) || $invocant;
    
    $options{guid}      ||= guid();
    $options{from}      ||= '';
    $options{to}        ||= [];
    $options{subject}   ||= '';
    
    # Wrap 'to' in an arrayref if it's not already
    if ( ref($options{to}) ne ref([]) ) {
        $options{to} = [ $options{to} ];
    }
    
    return bless \%options => $class;
}




1
