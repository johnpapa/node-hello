const http = require('http');
const port = process.env.PORT || 3000;

const app_env = process.env.APP_ENV || "unknown";
const app_version = process.env.APP_VERSION || "unknown";

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  //const msg = 'Hello Node!\n'
  const msg = `Hello Word! Application version ${app_version} - Environment ${app_env}\n`
  res.end(msg);
});

server.listen(port, () => {
  console.log(`Server running on http://localhost:${port}/`);
});
