package String::Inflector;
use 5.012;
use strict;
use warnings;

our $VERSION = "0.01";

use Exporter 'import';

our @EXPORT_OK = qw(
    camelize
    underscore
);

sub camelize {
}

sub underscore {
}


1;
__END__

=encoding utf-8

=head1 NAME

String::Inflector - Transoform string to other forms

=head1 SYNOPSIS

    use String::Inflector qw/
        camelize
    /;

    camelize('perl_mongers'); # => 'PerlMongers'

=head1 DESCRIPTION

String::Inflector is heavily inspired by RoR ActiveSupport::Inflector (http://api.rubyonrails.org/classes/ActiveSupport/Inflector.html)

=head1 LICENSE

MIT License

=head1 AUTHOR

Takanori Ishikawa E<lt>takanori.ishikawa@gmail.comE<gt>

=cut

