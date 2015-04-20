package Math::ConsumptionTax::JP;
use 5.008005;
use strict;
use warnings;

use Data::Util qw/is_number/;

our $VERSION = "0.01";

my @TAX_HISTORY = (0,3,5,8,10);

sub calculate{
    my ( $price ) = @_;

    return unless is_number($price);

    my %result = map{
        $_ => $price + int($price / 100 * $_);
    } @TAX_HISTORY;
    return \%result;
}

sub included_calculate{
    my ( $included_price , $tax_rate) = @_;
    return unless( is_number($included_price) && is_number($tax_rate) );

    my $plain_price = _convert_plain_price(
        $included_price , $tax_rate);

    return calculate( $plain_price );
}

sub _convert_plain_price{
    my ( $included_price , $tax_rate) = @_;

    return $included_price unless $tax_rate;

    my $rate_percentage = $tax_rate / 100 + 1;
    return int( $included_price / $rate_percentage );
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

