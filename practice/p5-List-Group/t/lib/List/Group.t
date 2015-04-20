use 5.014;
use warnings;
use utf8;

use Test::More;
use Test::Deep qw( cmp_deeply );

use List::Group qw( group_by );

subtest group_by => sub {

    subtest number => sub {
        cmp_deeply 
            {
                group_by { $_ % 2 == 0 ? 'even' : 'odd' } 0..9
            },
            {
                'even' => [qw( 0 2 4 6 8 )],
                'odd' => [qw( 1 3 5 7 9 )],
            }
        ;
    };

    subtest ascii_string => sub {
        my @fruits = qw( apple papaya avocado grape orange );
        cmp_deeply 
            {
                group_by { substr($_, 0, 1) } @fruits
            },
            {
                a => [qw( apple avocado )],
                g => [qw( grape )],
                o => [qw( orange )],
                p => [qw( papaya )],
            }
        ;
        cmp_deeply 
            {
                group_by { substr($_, -1, 1) } @fruits
            },
            {
                a => [qw( papaya )],
                e => [qw( apple grape orange )],
                o => [qw( avocado )],
            }
        ;
    };
    
    subtest utf8_japanese => sub {
        my @japanese_terms = qw( くり いちじく みかん しぶがき いちご );
        cmp_deeply 
            {
                group_by { substr($_, 0, 1) } @japanese_terms
            },
            {
                み => [qw( みかん )],
                く => [qw( くり )],
                し => [qw( しぶがき )],
                い => [qw( いちじく いちご )],
            }
        ;
    };

    subtest empty_array => sub {
        cmp_deeply 
            { group_by { 1 } () },
            {}
        ;
    };

    subtest hash_array => sub {
        my @foods = (
            my ($ramen, $soba_noodle, $beef_bowl) = (
                { type => 'noodle', name => 'ラーメン', },
                { type => 'noodle', name => 'そば', },
                { type => 'rice', name => '牛丼', },
            )
        );
        cmp_deeply 
            {
                group_by { $_->{ type } } @foods
            },
            {
                noodle => [$ramen, $soba_noodle],
                rice   => [$beef_bowl],
            }
        ;
    };
};

done_testing;
