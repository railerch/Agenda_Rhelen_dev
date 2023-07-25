const { Sequelize } = require("sequelize");
const FS = require("fs");
const PATH = require("path");
const config = JSON.parse(FS.readFileSync(PATH.join(__dirname, "config", "config.json")));
const conn = new Sequelize("agenda_rhelen", config[0].db.user, config[0].db.pass, {
    host: "localhost",
    dialect: "mysql"
});

// Probar la conexion
async function connTest() {
    try {
        await conn.authenticate();
        console.log("Conexion con Base de Datos => OK");
    } catch (err) {
        console.log("Conexion con Base de Datos => ERROR: " + err);
    }
};

module.exports = {
    connTest,
    conn
};