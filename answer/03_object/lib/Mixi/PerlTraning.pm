package Mixi::PerlTraning;

use strict;
use warnings;

sub hello { 'Hello, Perl world.' }

sub new {
    my $class = shift;
    bless +{}, $class;
}

sub hello_oo {
    my $self = shift;
    return 'Hello, Perl oo world';
}

1;

