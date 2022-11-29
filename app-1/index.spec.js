const {port} = require("./index.js");

const expectedGreeting = `Hello world 'app-1'!`;

var options = {
    host: 'localhost',
    path: '/',
    port
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
      throw new Error(`It must be: ${expectedGreeting}`);
    }
  });
}

http.request(options, callback).end();



