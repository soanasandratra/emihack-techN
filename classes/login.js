const db = require("./connections/connect")
// const bcrypt = require("bcryptjs")
const {testPassword}  =require("./password")
const login = (pseudo, password, cb)=>{
            db.query("select * from Users where pseudo_user = ?", [pseudo], (err, rows)=>{
                const user = rows[0]
                // console.log(rows);
                const id = user.id_user
                testPassword(password, user.password_user, (success)=>{
                    const testAdmin = user.role_user == 1
                    cb({
                        id : id,
                        connected : success,
                        admin : testAdmin
                    })
                })

                
            })

        }


module.exports = login