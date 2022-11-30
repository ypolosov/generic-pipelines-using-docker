const {greeting, startApp} = require("./index.js");

const expectedGreeting = 'Hello app-3';
if(startApp() === expectedGreeting){
    console.log(greeting);
}else{
    throw new Error(`It must be: ${expectedGreeting}`);
}