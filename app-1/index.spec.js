require('./index.js');
const http = require('http');

const expectedGreeting = `Hello world 'app-1'!`;

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
      throw new Error(`It must be: ${expectedGreeting} instead of ${str}`);
      process.exit(1);
    }
  });
}

try{
  http.request(options, callback).end();
}catch(e){
  throw new Error(`Can't make a request!`);
  process.exit(1);
}



