const http = require('http');

function getDataFromServer() {
  http.get('http://example.com/data.json', (res) => {
    let data = '';
    res.on('data', (chunk) => {
      data += chunk;
    });
    res.on('end', () => {
      const jsonData = JSON.parse(data);
      console.log(jsonData);
    });
  }).on('error', (err) => {
    console.log('Error: ' + err.message);
  });
}

getDataFromServer();
