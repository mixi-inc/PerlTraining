package List::Group;

our $VERSION = "0.01";
use 5.014;
use warnings;
use utf8;

use Exporter qw( import );
our @EXPORT_OK = qw( group_by );

sub group_by (&@) {
}

1;
__END__

=encoding utf-8

=head1 NAME

List::Group - リストをグループ分けする関数を提供するモジュール

=head1 SYNOPSIS

    use List::Group qw( group_by );

    my %odd_or_even = group_by { $_ % 2 == 0 ? 'even' : 'odd' } 0..3;
    ## ( odd => [1, 3], even => [0, 2])

=head1 DESCRIPTION

List::Group は与えられた関数の返り値を元に与えられた配列をグループ分けする関数"group_by"を提供するモジュールです。

=head1 LICENSE

Copyright (C) Yoshikazu Sawa.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Yoshikazu Sawa E<lt>yoshikazu.sawa@mixi.co.jpE<gt>

=cut

