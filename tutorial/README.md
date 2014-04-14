Perl 研修
=====

Agenda
----

* はじめに
* Perl について
* package / モジュール
* Perl の代表的モジュール
* Perl の環境系のしくみ

はじめに
----

* Perl, プログラミングの基礎知識がある前提で話します
* 時間もそれほど無いので，細かい説明はできませんが，質問があればどうぞ

Perl について
----

* 最新版は perl 5.18.2
* 最近は毎年マイナバージョンをリリースしてる<br />(5.20は，2014-05-20 予定)
* Perl6 は別言語として扱われています

package
----

package とは
----
<!-- id="package" -->

* Perl における名前空間です
* サブルーチンや変数のグループを作るのに使います

package の宣言
----

* 下記のように宣言します
* package の区切りは::(ダブルコロン)です

        package Some::Module;
        sub hello { 'world' }

サブルーチンの呼び出し
----

* Package名::サブルーチン名で呼び出します

        Some::Module::hello();# 'world'

モジュール
----

モジュールとは
----
<!-- id="module" -->

* package の中身を定義しているファイル
* package 名に対応したパス・ファイル名で保存します
* ファイル最後の評価値は真であることが必要です

        package Some::Module; # ➡ Some/Module.pm
        sub hallo { 'world' }
        1;

モジュールの呼び出し
----

* use を使います
* 名前からパス・ファイル名を判別して，ファイルが読み込まれます

        use Some::Module;

Perl でもオブジェクト指向
----

        package Some::Module;
        sub new {
            my $class = shift;
            bless +{}, $class;
        }
        sub hello {
            my $self = shift;
            return 'perl oo world';
        }
        1;

        my $module = Some::Module->new;
        $module->hello; # 'perl oo world'

Perl の代表的モジュール
----

CPAN
----

* ほしいものは大抵CPANにあります
* 他の言語で組み込みで用意されているものも，<br />モジュールとして存在することが多い
* [https://metacpan.org/](https://metacpan.org/) で探せます

[List::Util](https://metacpan.org/pod/List::Util), [List::MoreUtils](https://metacpan.org/pod/List::MoreUtils)
----

* List 系のユーティリティ
* 組み込み関数としては，map や grep などしかない
* ほしいものはこのあたりにあるかも

[Encode](https://metacpan.org/pod/Encode)
----

* 文字コードを扱うモジュール

[Data::Util](https://metacpan.org/pod/Data::Util)
----

* データとデータ型のためのユーティリティ集
* チェック関数や検証関数など

[Class::Accessor](https://metacpan.org/pod/Class::Accessor)
----

* アクセサ
    * 組み込みでは存在しません
* [Class::Accessor::Fast](https://metacpan.org/pod/Class::Accessor::Fast), [Class::Accessor::Lite](https://metacpan.org/pod/Class::Accessor::Lite) など他にもいろいろ

[Moose](https://metacpan.org/pod/Moose)/[Mouse](https://metacpan.org/pod/Mouse)/[Moo](https://metacpan.org/pod/Moo)
----

* Perl のモダンなオブジェクト機構
    * オブジェクトの機構ですら Yet Another なものが存在
* Perl に型システムも提供します
* Moose の軽量版が，Mouse や Moo です

[DBI](https://metacpan.org/pod/DBI)
---

* DB のインタフェイス
* Perl でDBを扱うときは，大抵このモジュールか，このモジュールを利用したモジュールで扱う

[Cache::Memcached::Fast](https://metacpan.org/pod/Cache::Memcached::Fast)
----

* Memcached のインタフェイス

Perl の環境系のしくみ
---

Perl の環境系のしくみ
---

* 他の言語にあるものは，わりとそろってます
    * CPAN/cpanm ➡ gem, pip
    * PSGI/Plack ➡ Rack, WSGI
    * Carton ➡ bundler, pip freeze
    * plenv, perlbrew ➡ rbenv, RVM, virtualenv, pythonz
    * Minilla ➡ bundle gem

CPAN/cpanm
----

* モジュールの管理
* CPAN: モジュールやソフトウェアを集めたアーカイブサイト
* [cpanm](https://metacpan.org/pod/App::cpanminus): CPANからモジュールなどをインストールするためのコマンドラインツール
    * github からもインストール可能

[PSGI/Plack](http://plackperl.org/)
----

* PSGI: WebフレームワークとWebサーバをつなぐ共通インタフェース
* Plack: PSGIユーティリティとリファレンス実装としてのPSGIサーバなど

[Carton](https://metacpan.org/pod/Carton)
----

* アプリケーションにおけるPerlモジュールの依存関係を管理するコマンドラインツール
* _Carton - Perl module dependency manager (aka Bundler for Perl)_

[plenv](https://github.com/tokuhirom/plenv), [perlbrew](http://perlbrew.pl/)
----

* Perl5 のインストール管理ツール
* バージョンと環境を切り替えて使える

[Minilla](https://metacpan.org/pod/Minilla)
----

* CPAN モジュールのオーサリングツール
* 他には Module::Starter, Dist::Zilla, Dist::Milla などもあります
