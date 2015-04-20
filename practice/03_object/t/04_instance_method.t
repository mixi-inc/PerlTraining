use strict;
use warnings;

use Test::More;
use Mixi::PerlTraining;

my $perl_training = Mixi::PerlTraining->new;
is $perl_training->hello_oo, 'Hello, Perl oo world', 'hello_oo method ok';

done_testing;
