const db = require("./connections/connect");
const { selectWhere } = require("./select");



const percentVente = (pv, cb)=>{
    
        db.query("select  sum(nb_vendu) vendu, vin_stock from RAPPORT inner join STOCK on RAPPORT.stock_rap = STOCK.id_stock where STOCK.pv_stock = "+pv+" group by vin_stock", (err, rap)=>{
            // console.log(rap);

            const sumTab = rap.map((value) => {
                return value.vendu
            });
            const indexVin = rap.map((idVin)=>{
                return idVin.vin_stock
            })
            const sumVendu = sumTab.reduce((total, value)=>{return total+value})
            const percentVins = rap.map((value)=>{
                return (value.vendu * 100)/ sumVendu
            })

           var vins = []
            let i = 0
           indexVin.forEach(id => {
            selectWhere("VIN", "id_vin", id, (vin)=>{
                vins.push(vin[0].nom_vin)
                i++
                if( i === indexVin.length){
                    cb({indexVin, vins, percentVins})
                }
            })
           });
           
        })
        
    }

const percentPvPerRegion = (region, cb) =>{
    db.query("select * from POINTVENTE where region_pv = "+region, (err, pvs)=>{
        console.log(pvs);
    })
}

module.exports = {percentVente, percentPvPerRegion}