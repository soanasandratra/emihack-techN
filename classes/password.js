const bcrypt = require("bcryptjs")

const testPassword = (str, hash, cb) =>{
    bcrypt.compare(str, hash,(err, success)=>{
        if(err) throw err
        cb(success)
    })
}

const generatePassword = (str, cb) =>{
    bcrypt.genSalt(10, (err, salt)=>{
        bcrypt.hash(str, salt, (err, hash)=>{
            if(err) throw err
            cb(hash)
        })
    })
}

module.exports = {testPassword, generatePassword}