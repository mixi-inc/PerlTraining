use strict;
use warnings;
use Test::More;

use Math::ConsumptionTax::JP;

subtest 'no params' => sub{
    is( Math::ConsumptionTax::JP::calculate() , undef);
};

subtest 'calculate' => sub{
    is_deeply( Math::ConsumptionTax::JP::calculate(100) ,
        {
            0  => 100,
            3  => 103,
            5  => 105,
            8  => 108,
            10 => 110
        }
    );
    is_deeply( Math::ConsumptionTax::JP::calculate(200) ,
        {
            0  => 200,
            3  => 206,
            5  => 210,
            8  => 216,
            10 => 220
        }
    );
};

subtest 'included_calculate' => sub{
    is_deeply( Math::ConsumptionTax::JP::included_calculate( 105, 5) ,
        {
            0  => 100,
            3  => 103,
            5  => 105,
            8  => 108,
            10 => 110
        }
    );
    is_deeply( Math::ConsumptionTax::JP::included_calculate( 216, 8) ,
        {
            0  => 200,
            3  => 206,
            5  => 210,
            8  => 216,
            10 => 220
        }
    );
    is_deeply( Math::ConsumptionTax::JP::included_calculate( 300, 0) ,
        {
            0  => 300,
            3  => 309,
            5  => 315,
            8  => 324,
            10 => 330
        }
    );
};

done_testing;
