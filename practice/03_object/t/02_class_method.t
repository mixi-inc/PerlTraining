use strict;
use warnings;

use Test::More;
use Mixi::PerlTraining;

is Mixi::PerlTraining::hello(), 'Hello, Perl world.', 'call class method';

done_testing;
