// ***********************importation**********************
const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const login = require("./classes/login");
const { selectNoWhere, selectWhere } = require("./classes/select");
const { generatePassword } = require("./classes/password");
const db = require("./classes/connections/connect");
const {selectPV, getAllVines} = require("./classes/getVines");
const {percentVente} = require("./classes/percentVendu");
const cors = require("cors")

var idUser = undefined;
var pv = undefined;

app.set("view engine", "ejs");

// ******************Middleware**************************
app.use(cors())

// static folder
app.use(express.static("public"));

app.use(bodyParser());

// session
require("./classes/config/session")(app);
// *********************end middleware*********************

// *********************route**************************
app.post("/", (req, res) => {
  const pseudo = req.body.pseudo;
  const password = req.body.password;
  login(pseudo, password, (result) => {
    if (result.connected) {
      req.session.connect = true;
      if (result.admin) {
        req.session.admin = true;
        res.redirect("/");
      } else {
        idUser = parseInt(result.id);
        db.query(
          "select * from POINTVENTE where user_pv =" + idUser,
          (err, idpv) => {
            req.session.id = parseInt(result.id);
            pv = idpv[0].id_pv;
            res.redirect("/");
          }
        );
      }
    } else {
      res.send("erreur de connection");
    }
  });
});

// route racine
app.get("/", (req, res) => {
  if (req.session.connect && req.session.admin) {
    getAllVines((vins)=>{
        res.render("indexadmin", {vines : vins});
    })
  } else if (req.session.connect) {
    selectPV(idUser, (result) => {
        // console.log(result);
      res.render("indexpv", { vins: result });
    });
  } else {
    res.redirect("/login");
  }
});

// login
app.get("/login", (req, res) => {
  res.render("login");
});

// stocks
app.get("/stocks", (req, res) => {
  if (req.session.connect) {
    require("../../../classes/getVines")(idUser, (stocks) => {
      res.render("stocks", { stocks: stocks });
    });
  } else {
    res.redirect("/login");
  }
});

// rapport



app.post("/rapport", (req, res) => {
  for (data in req.body) {

    selectWhere("VIN", "nom_vin", data, (result) => {
      console.log(result);
      db.query("select * from STOCK where vin_stock =" +result[0].id_vin +" and pv_stock = " +pv,
        (err, stock) => {
          if (err) throw err;
          // console.log(stock);
          db.query(
            "insert into RAPPORT (date_rap , nb_vendu, stock_rap) values(?, ?, ?)",
            [new Date(), req.body[data], stock[0].id_stock],
            (err, resultat) => {
              // console.log(resultat);
            }
          );
        }
      );
    });
  }
  res.redirect("/");
});




app.post("/newuser", (req, res) => {
  const user = req.body.pseudo;
  generatePassword(req.body.password, (hash) => {
    const password = hash;
    db.query(
      'insert into Users(pseudo_user, password_user, role_user) values("' +
        user +
        '", "' +
        password +
        '", 0)',
      (err, result) => {
        if (err) throw err;
        res.render("indexadmin", { success: "ajout avec success" });
      }
    );
  });
});

// the stat

app.get("/stat", (req, res) => {
  if (req.session.connect) {
    percentVente(idUser, (pourcentage) => {
      res.send();
    });
  } else {
    res.redirect("/login");
  }
});

// nombre de vin vendu par region

app.get("/region/:region", (req, res) => {
  require("../../../classes/selectPvRegion")(req.params.region, (pvs) => {
    var percentPerVines = []
    i = 0;
    pvs.forEach((pv) => {
      percentVente(pv.id_pv, (resultat) =>{
         percentPerVines.push({...resultat, pv})
          i++
          if(i == pvs.length){
            console.log(percentPerVines);
            res.send({percentPerVines})
          }
      })
    });

    
  });
});

app.get("/regions/:region/pv", (req, res) => {

});

// listening port
app.listen(8000);
