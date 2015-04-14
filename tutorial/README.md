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

* プログラミングの基礎知識がある前提で話します
* 時間もそれほど無いので，細かい説明はできませんが，質問があればいつでもどうぞ

実習の進め方
----

* Perl の講習に課題で手を動かしながら進めます
* 課題は PerlTraning のレポジトリにあるのでそれをやっていきます
* practice ディレクトリ以下に課題を用意してあります

Perl について
----

* 最新版は perl 5.20.2
* 最近は毎年マイナバージョンをリリースしてる<br />(今年は5.22がでます)
* Perl6 は Perl5 の姉妹言語(別の言語)

package
----

package とは
----
<!-- id="package" -->

* Perl における名前空間です
* サブルーチンや変数のグループを作るのに使います
* サブルーチンや変数などは必ずどこかの名前空間に紐付きます

package の宣言
----

* 下記のように宣言します
* package の区切りは::(ダブルコロン)です

        package Some::Module;

モジュール
----

モジュールとは
----
<!-- id="module" -->

* package の中身を定義しているファイル
* package 名に対応したパス・ファイル名で保存します
* ファイル最後の評価値は真であることが必要です

        package Some::Module; # ➡ Some/Module.pm
        use strict;
        use warnings;
        1;

モジュールの呼び出し
----

* use を使います
* 名前からパス・ファイル名を判別して，ファイルが読み込まれます

        use Some::Module;

課題1
----

* moduleの作成

その前に
----

課題レポジトリ clone
----

* https://github.com/mixi-inc/PerlTraining
* git clone してください

課題のディレクトリ構造
----

* lib ➡ モジュール
* t ➡ テスト

課題の動作確認
----

* テストが書かれているので，すべて通れば正答です
* prove コマンドを使ってテストを実行します

        $ cd practice/01_module
        $ prove -lv t/01_basic.t # テストファイル単体
        $ prove -lv t/           # ディレクトリ以下まとめてテスト実行

課題1 やってみましょう
----

* practice/01_module です
* 質問はいつでもどうぞ

モジュールの定義
----

サブルーチンの定義
----

* 通常の関数と同じく `sub` で定義します

        package Some::Module;
        sub hello{ 'Hello, perl world' }
        1;

サブルーチンの呼び出し
----

* Package名::サブルーチン名で呼び出します
* クラスメソッドです

        Some::Module::hello();

Perl でオブジェクト指向
----

* Perl でもオブジェクト指向できます

Perlのオブジェクト指向
----

メソッドの定義
----

* メソッドも関数と同じように定義する
* ただし第1引数にオブジェクトを受け取る
* `$self` で受け取るのが慣習

        sub hello_oo {
            my $self = shift;
            return 'Perl oo world';
        }

メソッドの呼び出し
----

* オブジェクトに対してアロー演算子(->)を使って呼び出す

        use Some::Module;
        my $module = Some::Module->new;
        $module->hello_oo; # 'Perl oo world'

オブジェクトは勝手に生成されるの?
----

* ですよね

オブジェクトの生成
----

* `bless` でリファレンスにpackage名を結びつけてオブジェクトにします
* 自分でコンストラクタを作ります

コンストラクタの定義
----

* コンストラクタの名前は決まってません
* Perlの慣習では `new` を使う

        package Some::Module;
        use strict;
        use warnings;
        sub new {
            my $class = shift;
            bless +{}, $class;
        }
        1;

コンストラクタの定義
----

* `$class` にはmoduleの名前が入っている
* `bless` でリファレンスをpackage名と結びつけることでオブジェクトになる
* ここでは空のハッシュリファレンスをオブジェクト化して返しています

        sub new {
            my $class = shift;
            bless +{}, $class;
        }

コンストラクタの呼び出し
----

* アロー演算子(->)を使って呼び出す
* メソッドと同じです

        use Some::Module;
        my $module = Some::Module->new;

アロー演算子って何なの?
----

* ハッシュリファレンスなどのメンバへのアクセス
* メソッド呼び出し時のシュガーシンタックス
    * だから第1引数にクラス名やオブジェクトを受け取る

        $hash_ref->{name};
        my $module = new 'Some::Module';# Some::Module->new
        hello_oo $module; # $module->hello_oo

課題2, 3 やってみましょう
----

* practice/02_class_method, practice/03_object です
* 質問はいつでもどうぞ

課題2テスト内容参考
----

* 今度の課題はテストの内容見ないと回答できないです
* is ➡ 一致していれば ok
* isa_ok ➡ そのクラスのインスタンスならば ok

✂✂✂✂✂✂✂✂✂✂✂✂✂✂ （ここまで書いた
----

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
    * 言語組み込みでは存在しません
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
