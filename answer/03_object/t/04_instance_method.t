use strict;
use warnings;

use Test::More;
use Mixi::PerlTraning;

my $perl_traning = Mixi::PerlTraning->new;
is $perl_traning->hello_oo, 'Hello, Perl oo world', 'hello_oo method ok';

done_testing;
