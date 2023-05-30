const express = require('express');
const bcryptjs = require('bcryptjs');
const User = require('../models/user');

const authRouter = express.Router();
//esempio di get:
authRouter.get('/user',(req,res)=>{
    res.json({"msg":"Massi"});
});

//SIGNUP
authRouter.post('/api/signup',async function (req,res){
    try {
    console.log(req.body); //log the body of the request
    const {name,email,password} = req.body;
    //get the data from client
    //cerco se c'è utente presente già sul db: (Async vado su db)
    const existingUser = await User.findOne({email:email});
    if(existingUser){
        //!utente già presente
        return res.status(400).json({msg:"User with same email already exists"});
    }
    const hashedPassword = await bcryptjs.hash(password, 8);

    let user = new User({
        email,
        password:hashedPassword,
        name,
    });


    //post data in he database
    user = await user.save(); //PROVO A SCRIVERE su DB (valida e se ok prova a scrivere e se ok mi restituisce lo user)

    //return data to the user (default status 200)
    res.json(user); //or json({user:user})
} catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = authRouter;
