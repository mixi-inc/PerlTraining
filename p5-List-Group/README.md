# NAME

List::Group - リストをグループ分けする関数を提供するモジュール

# SYNOPSIS

    use List::Group qw( group_by );

    my %odd_or_even = group_by { $_ % 2 == 0 ? 'even' : 'odd' } 0..3;
    ## ( odd => [1, 3], even => [0, 2])

# DESCRIPTION

List::Group は与えられた関数の返り値を元に与えられた配列をグループ分けする関数"group\_by"を提供するモジュールです。

# LICENSE

Copyright (C) Yoshikazu Sawa.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

Yoshikazu Sawa <yoshikazu.sawa@mixi.co.jp>
