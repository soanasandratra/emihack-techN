
const db = require("./connections/connect")
const {selectWhere} = require("./select")

const selectPV = (idUser, cb)=>{
    selectWhere("POINTVENTE", "user_pv", idUser, (resultat)=>{
        const pointDeVente = resultat[0].id_pv
        db.query("select * from VIN inner join STOCK on VIN.id_vin = STOCK.vin_stock where pv_stock = ?", [pointDeVente], (err,vins)=>{
            cb(vins)
        })
        
    })
}

const getAllVines = (cb) =>{
    db.query("select * from VIN inner join TYPE on VIN.type_vin = TYPE.id_type", (err, result)=>{
        if(err) throw err
        console.log(result);
        cb(result)
    })
}



module.exports = {selectPV, getAllVines}