const db = require("./connections/connect")
const { selectWhere } = require("./select")

const insertRapport = (datas)=>{
    for(data of datas) {
        selectWhere("VIN", "id_vin", data, (result)=>{
            console.log(result);
        })
    }
}

module.exports = insertRapport