const express = require('express');

const authRouter = express.Router();
//esempio di get:
authRouter.get('/user',(req,res)=>{
    res.json({"msg":"Massi"});
});

//SIGNUP
authRouter.post('api/signup',(req,res)=>{
    console.log(req.body); //log the body of the request
    const {name,email,password} = req.body;
    //get the data from client
    //post data in he database
    //return data to the user
});

module.exports = {authRouter};
