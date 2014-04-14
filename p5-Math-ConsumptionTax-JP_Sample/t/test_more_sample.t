# testファイルでも use strict; use warnings; は必須
use strict;
use warnings;

# 他のモジュール同様、テスト用のモジュールもuse して使います
use Test::More;

{ # use_ok
    # Test::Moreをuse すると、exportされたメソッド群(use_ok, ok , is , is_deeplyなどが使えるようになります)
    use_ok 'Test::More';

=test
    use_ok 'Test::Most';
=cut
}

{ # ok
    # ok は真偽値をチェックするメソッドです
    ok 1;
    # 第二引数で出力メッセージを渡せます
    ok 'aaa', 'aaa is true' ;
    my $ok = 'aa12bb';
    ok $ok;
    ok ( 1 == 1);

=test
    ok 0;
    ok '';
    ok undef;
    ok ( 'a' eq 'b');
=cut
}

{ # is
    # is は結果値と期待値を比較して判定するメソッドです
    is 1 , 1;
    # 第三引数で出力メッセージを渡せます
    is 'a' , 'a' , ' a equal a';
    my ($return , $expect) = ( 101 , 101 );
    is $return , $expect;

=test
    is 1 , 2;
    is 'a' , 'b' , ' a not equal b';
    my $not_expect = 102;
    is $return , $not_expect;
=cut
}

{ #is_deeply
    # is_deeplyはハッシュなどの深い構造までチェックするメソッドです
    is_deeply { 1 => 'aaa'} , { 1 => 'aaa'};

    my %return = (
        1  => 'aaa',
        2  => 'bbb',
        3  => 'ccc'
    );
    my %expect = %return;
    is_deeply \%return , \%expect;

=test
    my %not_expect = %return;
    $not_expect{3} = 'ddd';
    # valueが違ったりするとダメです
    is_deeply \%return , \%not_expect;
    
    my %over_expect = %return;
    $over_expect{4} = 'additional value';
    # 要素数も合っていないとダメです
    is_deeply \%return , \%over_expect;

    # 配列の場合は、順番まで一致していないとダメです
    is_deeply [qw/ 1 2 3/] , [qw/1 3 2/];
=cut
}


# 最後はdone_testing と書きましょう
done_testing;
