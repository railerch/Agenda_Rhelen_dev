const { conn, connTest } = require("../sequelize");
const PATH = require("path");
const URL = require("url");
const FS = require("fs");
data = JSON.parse(FS.readFileSync("./config/config.json", "utf8"));

// VISTAS
const landingPage = (req, res) => {
    res.status(200);
    res.header("content-type", "text/html");
    res.render("index", { server: data[0].server });
}

const vistaFormulario = (req, res) => {
    res.status(200);
    res.header("content-type", "text/html");
    res.render("data-entry", { estaciones: data[0].estaciones, horarios: data[0].horarios, server: data[0].server });
}

const vistaTabla = (req, res) => {
    async function tmp() {
        [rows, metadata] = await conn.query("SELECT * FROM agenda");
        let data = tmp();
        res.status(200);
        res.header("content-type", "text/html");
        res.render("data-query", { registros: rows });
    }
    tmp();
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
    async function agendarCita(data) {
        let sql = `INSERT INTO agenda (id, fecha_reg, nombre, cedula, edad, genero, telefono, correo, disciplina, categoria, estacion, fecha_cita, hora_cita) 
        VALUES (${null}, '${new Date().toLocaleString()}', '${data.nombre}', '${data.cedula}', ${data.edad}, '${data.genero}', '${data.telefono}', '${data.correo}', '${data.disciplina}', '${data.categoria}', '${data.estacion}', '${data.fecha_cita}', '${data.hora_cita}')`;

        [rows, metadata] = await conn.query(sql);
        res.status(200);
        res.json({ row: rows, metadata: metadata });
    }
    agendarCita(req.body);
}

module.exports = {
    landingPage,
    vistaFormulario,
    insertarRegistro,
    vistaTabla,
    consultarRegistros
}