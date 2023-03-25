const session = require("express-session")

module.exports = (app) =>{
    app.use(session({
        secret: 'fdjkhkhfdsjhksfqjht',
        resave: false,
        saveUninitialized: true,
        cookie: { secure: false }
      }))
}
