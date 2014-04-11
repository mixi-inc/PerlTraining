package Math::ConsumptionTax::JP;
use 5.008005;
use strict;
use warnings;

our $VERSION = "0.01";

sub calculate{
    my ( $price ) = @_;

    return if $price !~ /\A\d+\z/;

    return {
        0  => 100,
        3  => 103,
        5  => 105,
        8  => 108,
        10 => 110,
    };
}

sub included_calculate{
    return {
        0  => 100,
        3  => 103,
        5  => 105,
        8  => 108,
        10 => 110,
    };
}

1;

__END__

=encoding utf-8

=head1 NAME

Math::ConsumptionTax::JP - Calculate Japanese Consumption Tax

=head1 SYNOPSIS

    use Math::ConsumptionTax::JP;

    my $all_tax_price = Math::ConsumptionTax::JP->calculate(100);
    # => {
    #       0  => 100,
    #       3  => 103,
    #       5  => 105,
    #       8  => 108,
    #       10 => 110
    #    }

    my $all_tax_price = Math::ConsumptionTax::JP->included_calculate(105,5);
    # => {
    #       0  => 100,
    #       3  => 103,
    #       5  => 105,
    #       8  => 108,
    #       10 => 110
    #    }

=head1 DESCRIPTION

Math::ConsumptionTax::JP provide price value included (all times) consumption tax.


=head1 LICENSE

Copyright (C) masartz.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

masartz E<lt>masartz@gmail.comE<gt>

=cut

