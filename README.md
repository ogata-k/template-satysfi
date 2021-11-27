# template-satysfi
[SATySFi](https://github.com/gfngfn/SATySFi) で組版するときのプロジェクトテンプレートです。

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
でインストール可能なSATySFi用パッケージを一行ずつ列挙するためのファイルです。#以降はコメントとして解釈されます。

### cmd
各種便利コマンドのエイリアス的なスクリプト群です。

利用可能なコマンドは以下となります。

* build-docker.sh<br/>.satysfi-packagesで上げられたSATySFiのパッケージをインストールしてDockerイメージを作成し、
Dockerを使わなくても参照できるようにパッケージデータをworkspace/.satysfiディレクトリに吐き出します。<br/>
引数に--no-cacheを渡すことでキャッシュを削除して実行することができます。<br/>
注意：以下のファイルに変更があった場合はbuild-docker.shを叩いてDockerイメージを更新してください。
    * .satysfi-packages
    * .project-env

* build-main.sh<br/>workspaceディレクトリ下のmain.saty（mainSrcFileName変数で指定）をテンプレートサンプル.pdf（mainPdfFileName変数で指定）として書き出します。
* check-type.sh<br/>引数に指定されたファイルの型チェックを行います。引数はworkspaceディレクトリを起点にしたファイルパスを指定してください。
* check-type-all.sh<br/>workspaceディレクトリ下の拡張子がsaty, satyh, satygのすべてのファイルの型チェックを行います。
* load-packages.sh<br/>Dockerイメージでインストール済みのパッケージデータをworkspace/.satysfiディレクトリに吐き出します。
* opam.sh<br/>workspaceディレクトリ下で呼び出されるopamコマンドのエイリアスです。
* satyrographos.sh<br/>workspaceディレクトリ下で呼び出されるsatyrographosコマンドのエイリアスです。<br/>
なお、ここでパッケージをインストールしてもそのコンテナは削除されてしまうので無意味になります。パッケージインストールについては.satysfi-packagesファイルとbuild-docker.shコマンドを使用してください。
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
