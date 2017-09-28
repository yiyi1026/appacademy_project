const express = require('express');
const app = express();
const http = require('http').Server(app);
const path = require('path');

app.use(express.static('public'));

app.get('/',  (req, res) => {
  res.sendFile(path.join(__dirname, 'public'));
})

const chatServer = require('./chatServer');
// chatServer.listen(http);

const PORT = 3000


//why not use app.listen???
http.listen(PORT, function () {
  console.log(__dirname);
  console.log(`listening on port ${PORT}!`);
})