const http = require('http');
const port = process.env.PORT || 3000;


const path = require('path')


const server = http.createServer((req, res) => {
   res.sendFile(path.join(__dirname, 'index.html'))
  res.statusCode = 200;
  const msg = 'Hello Node!\n'
  res.end(msg);
});

server.listen(port, () => {
  console.log(`Server running on http://localhost:${port}/`);
});


