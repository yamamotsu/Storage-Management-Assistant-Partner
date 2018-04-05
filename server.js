// httpのインポート
var http = require('http');
// socket.ioのインポート
var socketio = require('socket.io');
// fs:ファイルストリームモジュールインポート
var fs = require('fs');
// サーバコマンドを扱うためのモジュール
var exec = require('child_process').exec;

var host = '0.0.0.0';

if(process.argv[2] == ''){
	var port = 8080;
}else{
	var port = process.argv[2];
}

// スイッチの接続されてるピン番号
// 番号はwiringPiのgpio番号に準ずる
var sw_pin = 0;

server = http.createServer(serveron);

function serveron(req,res) {
	// アイコン取得リクエストは無視
	if(req.url == '/favicon.ico'){
		return;
	}

	console.log(req.method);

	res.writeHead(200, {'Content-Type' : 'text/html'});

	// 最後のレスポンスは以下のようにres.end()の引数に書いてもいい.
	// fs.readFileSync()はhtmlファイルの中身を(同期で)レスポンスしてくれる
	res.end(fs.readFileSync(__dirname + '/index.html', 'utf-8'));
}

// httpサーバースタート
server.listen(port);

// コンソールログ出力
console.log('node http server started.');

// websocket通信開始
var io = socketio.listen(server);

// スイッチの状態を入れる変数を宣言
var sw = '0';

// setInterval(function, time) :time(ms)毎にfunction実行
setInterval(function(){
	// wiringPiの `gpio read [pin]`コマンドを実行して標準出力を得る
	exec('gpio read ' + sw_pin, function(err, stdout, stderr){
		console.log('switch status:' + stdout);
		sw = stdout;
	});
}, 1000);

// クライアントからwebsocketコネクションがあった時に呼ばれる関数を定義
io.sockets.on('connection', function(socket){
	console.log('socket connected.');
	setInterval(function(){
		// スイッチ状態の値を'switch_data'という名前で送信
		socket.emit('switch_data', {value : sw});
	}, 1000);
});
