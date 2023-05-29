console.log("Hello, World from Node Server");


const express = require('express');

const PORT = 3000; //porta in ascolto

const app = express();

app.get('/hello-world', (req,res)=>{
    res.json({"hi":"hello world MASSI"});
});

app.get("/",(req,res)=>{
 res.json({
    "name":"Massimiliano"
 });
});
//creating API 0.0.0.0 = from Everywhere
app.listen(PORT,"0.0.0.0", () => {
    console.log(`connected at port ${PORT} hello`);
})