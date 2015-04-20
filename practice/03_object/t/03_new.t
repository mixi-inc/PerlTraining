use strict;
use warnings;

use Test::More;
use Mixi::PerlTraining;

my $perl_traning = Mixi::PerlTraining->new;
isa_ok $perl_traning, 'Mixi::PerlTraining';

done_testing;
