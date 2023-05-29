console.log("Hello, World from Node Server");

//IMPORTS FROM PACKAGES
const express = require('express');
const mongoose = require('mongoose');

//IMPORT FROM OTHER FILES
const authRouter = require('./routes/auth');
//INIT
const PORT = 3000; //porta in ascolto

const app = express();
//middleware
//CLIENT -> MIDDLEWARE -> SERVER -> MIDDLEWARE -> CLIENT
app.use(authRouter.authRouter);

//connections
mongoose.connect("").then(()=>{
    console.log("Connection to MongoDB successfull");
}).catch(e => {
    console.log(e);
});



//creating API 0.0.0.0 = from Everywhere
app.listen(PORT,"0.0.0.0", () => {
    console.log(`connected at port ${PORT} hello`);
})