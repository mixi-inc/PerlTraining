use strict;
use warnings;

use Test::More;
use Mixi::PerlTraning;

my $perl_traning = Mixi::PerlTraning->new;
isa_ok $perl_traning, 'Mixi::PerlTraning';

done_testing;
