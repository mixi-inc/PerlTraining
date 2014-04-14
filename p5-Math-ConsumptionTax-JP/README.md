# NAME

Math::ConsumptionTax::JP - Calculate Japanese Consumption Tax

# SYNOPSIS

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

# DESCRIPTION

Math::ConsumptionTax::JP provide price value included (all times) consumption tax.



# LICENSE

Copyright (C) masartz.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

masartz <masartz@gmail.com>
