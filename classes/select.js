const db = require("./connections/connect")
const selectNoWhere = (table, cb) =>{
    db.query("select * from "+ table, (err, rows)=>{
        if(err) {
            cb( {
                error : "il y a un erreur"
            })
            throw err
        } else{
            cb(rows)
        }
        
    })
}

const selectWhere = (table, col, value, cb)=>{
    db.query(`select * from ${table} where ${col} = ?`,[ value], (err, rows)=>{
        if(err) {
            cb({error : "un erreur est survenu"})
            throw err
        }else{
            cb(rows)
        }
    })
}

module.exports = {selectNoWhere, selectWhere}