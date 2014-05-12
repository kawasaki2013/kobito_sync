#[Kobito](http://kobito.qiita.com/)で管理してるmarkdownのdbファイルを、bitbucket/githubにpush/pullして複数PCで共有

- dropboxの同期ではタイムラグがあって使えない
- 自分は会社mac、家macで使ってる


##セットアップ

```
cd $HOME/Library
# バックアップ
cp -fr Kobito ~/Desktop/

# 既存ファイルを削除
rm -fr Kobito

# git clone

```
git clone git@github.com:vwxyz/kobito_sync.git
```

```

`.bash_profile`追記

```
. $HOME/Library/Kobito/kobito.sh
```

##コマンド一覧

```
kobitoコマンド：使い方
			 #家でkobito閉じた後
             kobito push home
             #会社でkobito閉じた後
             kobito push office
             #github/bitbucketから最新データ取ってくる
             kobito pull force
             kobito help

```
