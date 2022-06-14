const http = require('http');
const port = process.env.PORT || 3000;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  const msg = 'spexmojoworking 1234567890 iam working on this !\n'
  res.end(msg);
});

server.listen , () => {
  console.log(`Server running on http://50.18.134.35:8080/');
});
