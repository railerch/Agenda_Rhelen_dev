const { conn, connTest } = require("../sequelize");
const PATH = require("path");
const URL = require("url");
const FS = require("fs");

// VISTAS
const landingPage = (req, res) => {
    res.status(200);
    res.header("content-type", "text/html");
    res.render("index");
}

const vistaFormulario = (req, res) => {
    data = JSON.parse(FS.readFileSync("./config/config.json", "utf8"));
    res.status(200);
    res.header("content-type", "text/html");
    res.render("data-entry", { estaciones: data[0].estaciones, horarios: data[0].horarios });
}

const vistaTabla = (req, res) => {
    console.log(URL.parse(req.url));
    res.status(200);
    res.header("content-type", "text/html");
    res.render("data-query");
}

// OPERACIONES CON DATOS
const consultarRegistros = (req, res) => {
    connTest();
    async function tmp() {
        [rows, metadata] = await conn.query("SELECT * FROM agenda");
        res.header("content-type", "application/json");
        res.json(rows);
        res.end();
    }
    tmp();
}

const insertarRegistro = (req, res) => {
    let data = req.body;
    console.log(data);
    res.status(200);
    res.send("Request recibido...");
}

module.exports = {
    landingPage,
    vistaFormulario,
    insertarRegistro,
    vistaTabla,
    consultarRegistros
}