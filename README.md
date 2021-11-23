# template-satysfi
SATySFiで組版するときのプロジェクトテンプレートです。

## 前提
以下を利用できる環境であることを想定しています。

* Docker
* Git
* Bash

## ファイルの説明
プロジェクトのルート以下のディレクトリ構造は以下のようになっています。
### .project-env
本プロジェクトのenvファイルです。
cmd下の各コマンドを実行する際最初に読み込まれます。

### .satysfi-packages
opam install \<package\> && satyrographos install;
でインストール可能なSATySFi用パッケージ(\<package\>)を改行で列挙するためのファイルです。
.project-envのsatysfiPackagesFileFromProjectRootでプロジェクトのルートからのファイルパスを指定することで変更できます。

### cmd
各種便利コマンドのエイリアス的なスクリプト群です。

利用可能なコマンドは以下となります。

* build-docker.sh<br/>.satysfi-packagesで上げられたSATySFiのパッケージをインストールしてDockerイメージを作成します。
注意：以下のファイルに変更があった場合はbuild-docker.shを叩いてDockerイメージを更新してください。
    * .satysfi-packages
    * .project-env

* build-pdf.sh<br/>workspaceディレクトリ下のmain.saty(srcFileName変数で指定)をテンプレートサンプル.pdf(pdfFileName変数で指定)として書き出します。
* check-src.sh<br/>workspaceディレクトリ下のファイル名を引数に指定するとsatysfiコマンドの型チェックをすることができます。
* opam.sh<br/>workspaceディレクトリ下で呼び出されるopamコマンドのエイリアスです。
* satyrographos.sh<br/>workspaceディレクトリ下で呼び出されるsatyrographosコマンドのエイリアスです。
* satysfi.sh<br/>workspaceディレクトリ下で呼び出されるsatysfiコマンドのエイリアスです。
* search-pkg.sh<br/>SATySFiのパッケージを検索するopam listコマンドのエイリアスです。

### docker
dockerの設定が格納されているディレクトリです。
.project-envのdockerRoot変数で指定されています。

.project-envのdockerから始まる変数で処理を制御することができます。
デフォルトでは$dockerTagの値を書き換えるとSATySFiのバージョンを変更できます。
利用可能な値はベースイメージの[amutake/docker-satysfi](https://github.com/amutake/docker-satysfi)を確認してください。

### workspace
作業用ディレクトリです。
.project-envのworkspace変数で指定されています。

