const http = require("http");

const expectedGreeting = `Hello world 'App 2'!`;

var options = {
  host: "localhost",
  path: "/",
  port: process.env.PORT,
  method: "GET",
};

callback = function (response) {
  var str = "";

  //another chunk of data has been received, so append it to `str`
  response.on("data", function (chunk) {
    str += chunk;
  });

  //the whole response has been received, so we just print it out here
  response.on("end", function () {
    if (str === expectedGreeting) {
      console.log(str);
    } else {
      throw new Error(`It must be: ${expectedGreeting} instead of ${str}`);
    }
  });
};

try {
  http.get(options, callback).end();
} catch (e) {
  throw new Error(`Can't make a request!`);
}
