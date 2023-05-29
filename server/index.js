console.log("Hello, World from Node Server");


const express = require('express');

const PORT = 3000; //porta in ascolto

const app = express();
//creating API 0.0.0.0 = from Everywhere
app.listen(PORT,"0.0.0.0", () => {
    console.log(`connected at port ${PORT} hello`);
})