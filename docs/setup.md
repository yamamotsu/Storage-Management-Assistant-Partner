# Raspberry Piセットアップ

RaspberryPiのセットアップ(初期設定)を行います.  
RaspberryPiは本体のMicroSDカードスロットに挿入されたMicroSDカードから  
OSのイメージを読みだして動作します.  
そのためRaspberryPiを利用するにはまずMicroSDカードにOSイメージを書き込む必要があります.
## Raspbian インストール
RaspberryPi用のOS:**Raspbian** を入れていきます.  
RaspbianはLinuxのDebian系OSの一つで、  
Linux初心者にも使いやすいグラフィカルインターフェース等が標準搭載されています.

1. まずはMicroSDカードリーダを使用してPCとMicroSDカードを接続します.
1. **Etcher** というOS等のイメージをSDカード等に書き込むソフトをインストールします.  
Etcher([https://etcher.io/](https://etcher.io/))
1. Raspbianを公式サイトからダウンロードします.
フェーズ1ではRaspbian stretch with desktopをインストールしています.   
以下の公式サイトからRASPBIAN STRETCH WITH DESKTOPのDownload ZIPボタンをクリックしてダウンロードします.  
RASPBIAN ([https://www.raspberrypi.org/downloads/raspbian/](https://www.raspberrypi.org/downloads/raspbian/))
1. Raspberry Piのキットに付属しているMicroSDカードをPCに接続します.
1. Etcherを起動して左側のselect imageから先ほどインストールしたRaspbianのOSイメージ(2018-03-13-raspbian-stretch.zip)を選択します.また中央のドライブのマークに表示されているドライブのアルファベットがSDカードのドライブでなければChangeから変更して正しいドライブを指定します.  

![Etcher](etcher.png)

全ての変更ができたら,右のFlash!ボタンを押してSDカードにOSを書き込みます.書き込みにはしばらくかかります.Flash Complete!と表示されればインストール完了です.SDカードをPCからRaspberryPiに差し替えます.

## RaspberryPi 起動
RaspberryPiにHDMIケーブルを接続してディスプレイに接続し,ACアダプタを接続します.
また付属の無線式マウス・キーボードのUSBレシーバ(マウスの裏に収納)を本体に接続します.
ACアダプタのスイッチを入れると,本体のLEDランプが赤色に点灯し,更にSDカードにOSが正常にインストールされており,OSが読みだされると緑色のLEDが点灯します.
デスクトップ画面は以下のようになります.

## キーボード設定&ネットワーク設定
キーボードレイアウトを日本語キーボード用に設定します.  
左上のラズベリーマークをクリックし,Preferences→Mouse and Keyboard Settingsをクリックします.  
Keyboardタブをクリック,Keyboard Leyoutボタンをクリックします.  
CountryをJapanに変更,VariantをJapaneseに変更してOKを押すと,日本語キーボード用の設定になります.

次に右上のネットワークアイコンをクリックし,ネットワークに接続します.
## ターミナル起動&初期設定
以後,RaspberryPiの操作は基本的にターミナルで行います.ターミナルはWindowsでいうコマンド・プロンプトです.linux等を扱ったことがない人はターミナルの操作に慣れる必要があります.
ターミナルの使い方については別文書にまとめる予定.

`Ctrl+Alt+T`キーでターミナルを起動します. 以下の順にコマンドを入力して初期設定を行っていきます.  

### 1. リポジトリを最新にする  
sudoは管理者権限で実行するという意味  
apt-get はアプリケーションのインストール・アンインストール等の管理をするツール  
```
pi@raspberrypi:~$ sudo apt-get update
```

### 2.ufwというファイアウォール設定ツールをインストール
sudo apt-get install [アプリ名]でアプリをインストールすることができる
```
pi@raspberrypi:~$ sudo apt-get install ufw
```

### 3.ufwでIPv6を使用しないように設定
nanoというターミナル上で編集を行うテキストエディタでファイルを書き換える
まずnanoで設定するファイルを開きます
```
pi@raspberrypi:~$ sudo nano /etc/default/ufw
```

するとターミナルにテキストファイルの中身が表示されます.  
カーソルキーで9行目あたりにある`IPV6=yes`の行に移動し,  
`IPV6=no`に書き換えます.書き換えたら,`Ctrl+O`を押して保存します.  
保存したら`Ctrl+X`キーで終了し,もとのターミナル画面に戻ります.  

戻ったら,ufwを有効化します
```
pi@raspberrypi:~$ sudo ufw enable
```

これでufwの初期設定は完了です.次はファイアウォールの設定ですが,
今回は後述するfirewalltool.shというシェルスクリプトを用いて設定を行います.
これは本プロジェクトで必要なファイアウォールの設定を簡潔に行うことができるスクリプトです.

ufwを用いたファイアウォールの設定の仕方を詳しく知りたい場合は以下の記事などを参考にしてください.

[http://make.bcde.jp/raspberry-piファイヤーウォールの設定/](http://make.bcde.jp/raspberry-pi/%E3%83%95%E3%82%A1%E3%82%A4%E3%83%A4%E3%83%BC%E3%82%A6%E3%82%A9%E3%83%BC%E3%83%AB%E3%81%AE%E8%A8%AD%E5%AE%9A/)

# Nodejsインストール+スクリプト作成+実行

[こちら](https://qiita.com/yamamotsu/items/a35a30a28523a3f51042)の記事に投稿しました.
