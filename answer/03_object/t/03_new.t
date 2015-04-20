use strict;
use warnings;

use Test::More;
use Mixi::PerlTraining;

my $perl_training = Mixi::PerlTraining->new;
isa_ok $perl_training, 'Mixi::PerlTraining';

done_testing;
