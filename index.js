const http = require('http');
const port = process.env.PORT || 3000;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  const msg = 'Hello Node!\n'

  const env = JSON.stringify(process.env, null, 2)
  
  res.end(`${msg}\n\n${env}`);
});

server.listen(port, () => {
  console.log(`Server running on http://localhost:${port}/`);
});
