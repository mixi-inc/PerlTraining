use strict;
use warnings;

use Test::More;
use Mixi::PerlTraning;

is Mixi::PerlTraning::hello(), 'Hello, Perl world.', 'call class method';

done_testing;
