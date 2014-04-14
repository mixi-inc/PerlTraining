use strict;
use warnings;

use Test::More;

BEGIN { use_ok 'String::Inflector' => 'camelize' };

subtest 'given undef' => sub {
    is camelize(undef), undef, 'is undef';
};

subtest 'given empty string' => sub {
    is camelize(''), '', 'is empty string';
};

subtest 'given blank string' => sub {
    is camelize('  '), '  ', 'is not modified';
};

my %spec = (
    'a'           => 'A',
    'A'           => 'A',
    'hello'       => 'Hello',
    'Hello'       => 'Hello',
    'hello_world' => 'HelloWorld',
    'HelloWorld'  => 'HelloWorld',
);

while ( my ($input, $output) = each %spec ) {
    subtest "given '$input'" => sub {
        is camelize($input), $output, 'is camelized';
    };
}

done_testing;
