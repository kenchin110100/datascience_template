DATASCINECE_TEMPLATE
====

データ分析/開発のためのデフォルトフォルダ構成


## ディレクトリ構成

```
.
├── .devcontainer
│   └── devcontainer.json # vscodeでのdocker build情報を記載
├── .env.dev # 開発環境用の環境変数
├── .env.prod # プロダクション用の環境変数
├── .gitignore
├── .vscode
│   ├── launch.json # vscode上でのdebug用のコマンド
│   └── settings.json # vscodeの設定
├── Dockerfile.dev # 開発環境のdocker設定
├── Dockerfile.prod # productionコード用のdocker設定
├── Makefile # docker操作用のmakeコマンド
├── README.md
├── data # データを格納するディレクトリ
│   ├── external
│   ├── interim
│   ├── processed
│   └── raw
├── docker-compose.yml
├── models # モデルを格納するディレクトリ
├── notebooks # jupyter notebookを格納するディレクトリ
│   └── 01_eda.ipynb
├── poetry.lock
├── pyproject.toml # 依存ライブラリの情報（linterの設定も記載）
├── src
│   ├── experiments # 実験用のソースコードを格納するためのディレクトリ
│   │   └── experiment01.py
│   └── production # プロダクション用のソースコードを格納するディレクトリ（モジュール名は適宜変更）
│       ├── __init__.py
│       ├── __main__.py
│       └── calculator.py
└── tests # テストコードを格納するディレクトリ
    ├── __init__.py
    ├── test_experiments
    │   ├── __init__.py
    │   └── test_experiment01.py
    └── test_production
        ├── __init__.py
        └── test_calculator.py
```


## 事前準備

- VSCODEのインストール
- ms-vscode-remote.remote-containersのインストール
- Dockerfile.dev / Dockerfile.prodのイメージバージョンの変更
  - 構築したいPython環境に合わせる
- pyproject.tomlの変更
  - nameやパッケージなどの情報

## 実行手順

- vscodeを起動し、imageのbuild
  - vscode経由でビルドすると、vscode extensionsのインストールもできる
  - vscodeを経由しない場合は`make build-dev`を実行（ただし、vscode extensionsのインストールはされない）

- 仮想環境の起動・停止
  - vscodeを起動したタイミングで、コンテナ起動がされる。vscodeをshutdownするとコンテナも同時に停止される
  - vscodeを介さない場合は、`make start`、`make stop`

- ライブラリの追加
  - vscodeターミナルから実施する場合は、`poetry add xxxxx`で実行（vscodeのターミナルは仮想環境にログインした状態なので、そのままのコマンドで実行可能
  - vscode経由で実施しない場合は、`make add-xxxxx`


## その他

```
# 起動中のコンテナの確認
$ docker ps
# 全てのコンテナの確認
$ docker ps -a
# イメージの確認
$ docker images
# コンテナの削除
$ docker rm [コンテナID]
# イメージの削除
$ docker rmi [イメージID]
# danglingイメージの一括削除
$ make remove-dangling-images
```