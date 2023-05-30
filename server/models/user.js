const mongoose = require('mongoose');
const emailCheck = require('node-email-check');
const passwordValidator = require('password-validator');
var schema = new passwordValidator();
schema
.is().min(6); 

const userSchema = mongoose.Schema({
    name: {
        required: true,
        type: String,
        trim: true,
    },
    email: {
        required: true, //NOT NULL
        type: String,
        trim: true,
        validate: {
            validator: (value)=>{
                
                const re =
                /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
              //return value.match(re);
              return emailCheck.isValidSync(value);
            },
            message: "Please enter a valid email address",
        }
    },
    password: {
        required: true,
        type: String,
        validate: {
            validator: (value)=>{
                return schema.validate(value);
            },
            message: "Password has to be at least 6 characters"
        }
        
      },
      address: {
        type: String,
        default: "",
      },
      type: {
        type: String,
        default: "user",
      },
      //TODO: cart
});

const User = mongoose.model('User',userSchema);
module.exports=User;