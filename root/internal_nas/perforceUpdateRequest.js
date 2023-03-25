const fs = require('fs');
const net = require('net');

const host = 'deimos.doorimoon.com';
const port = 1666;

// 로그 디렉토리 생성
const logDir = './logs';
if (!fs.existsSync(logDir)) {
  fs.mkdirSync(logDir);
}

// 로그 파일 생성
const now = new Date();
const filename = `${now.getFullYear()}${now.getMonth()+1}${now.getDate()}${now.getHours()}${now.getMinutes()}${now.getSeconds()}.txt`;
const logFile = `${logDir}/${filename}`;

// 소켓 연결
const socket = net.connect(port, host, () => {
  console.log('Connected to server!');
  
  // 파일 수신 요청
  socket.write('get /depot/Project/Contents/file.txt\n');
});

// 파일 수신 처리
socket.on('data', data => {
  fs.appendFileSync(logFile, data);
});

// 소켓 종료 처리
socket.on('end', () => {
  console.log('Disconnected from server.');
});
