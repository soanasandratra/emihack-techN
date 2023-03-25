const db = require("./connections/connect")
const { selectNoWhere, selectWhere } = require("./select")

module.exports = (region, cb) => {
    selectWhere("REGION","nom_reg", region, (result)=>{
        const region = result[0]
        selectWhere("POINTVENTE", "region_pv", region.id_reg, (pointventes)=>{
            cb(pointventes)
        })
    })
}