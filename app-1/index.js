const http = require('http');

const hostname = '0.0.0.0';
const port = process.env.PORT;
const appName = process.env.APP_NAME;

const server = http.createServer((req, res) => {
                          
    res.statusCode = 200;
    res.setHeader('Content-Type', 'text/plain');
    res.end(`Hello world '${appName}'!`);
});
server.listen(port, hostname, () => {
    console.log(`Server is started http://${hostname}:${port}/`);
});

