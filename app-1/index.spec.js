const { execSync } = require('node:child_process');
const http = require('http');

const child = execSync('node',['index.js']);

const expectedGreeting = `Hello world 'App 1'!`;

var options = {
    host: 'localhost',
    path: '/',
    port: process.env.PORT
  };
  
callback = function(response) {
  var str = '';

  //another chunk of data has been received, so append it to `str`
  response.on('data', function (chunk) {
    str += chunk;
  });

  //the whole response has been received, so we just print it out here
  response.on('end', function () {
    if(str === expectedGreeting){
      console.log(str);
    }else{
      console.error(`It must be: ${expectedGreeting} instead of ${str}`);
      process.exit(1);
    }
  });
}

try{
  http.request(options, callback).end();
}catch(e){
  console.error(`Can't make a request!`);
  process.exit(1);
}finally{
    child.kill();
}



