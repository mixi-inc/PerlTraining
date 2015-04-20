use strict;
use warnings;

use Test::More;

BEGIN { use_ok 'String::Inflector' => 'underscore' };

subtest 'given undef' => sub {
    is underscore(undef), undef, 'is undef';
};

subtest 'given empty string' => sub {
    is underscore(''), '', 'is empty string';
};

subtest 'given blank string' => sub {
    is underscore('  '), '  ', 'is not modified';
};

my %spec = (
    'a'           => 'a',
    'A'           => 'a',
    'hello'       => 'hello',
    'Hello'       => 'hello',
    'hello_world' => 'hello_world',
    'HelloWorld'  => 'hello_world',
);

while ( my ($input, $output) = each %spec ) {
    subtest "given '$input'" => sub {
        is underscore($input), $output, 'is camelized';
    };
}

done_testing;
