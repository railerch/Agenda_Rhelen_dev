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
        try {
            [rows, metadata] = await conn.query("SELECT * FROM agenda");
            res.status(200);
            res.header("content-type", "text/html");
            res.render("data-query", { registros: rows, server: data[0].server });
        } catch (error) {
            res.status(500);
            res.send(error.name);
            res.end();
        }
    }
    tmp();
}

// OPERACIONES CON DATOS
const horariosNoDisponibles = (req, res) => {
    let fechaCita = req.params.fechaCita;
    let estacion = req.params.estacion;

    async function tmp() {
        try {
            [rows, metadata] = await conn.query(`SELECT hora_cita AS hora_no_disponible FROM agenda WHERE estacion = '${estacion}' AND fecha_cita = '${fechaCita}'`);
            res.header("content-type", "application/json");
            res.json(rows);
            res.end();
        } catch (error) {
            res.status(500);
            res.send(error.name);
            res.end();
        }
    }
    tmp();
}

const consultarRegistros = (req, res) => {
    connTest();

    async function tmp() {
        try {
            [rows, metadata] = await conn.query("SELECT * FROM agenda");
            res.header("content-type", "application/json");
            res.json(rows);
            res.end();
        } catch (error) {
            res.status(500);
            res.send(error.name);
            res.end();
        }
    }
    tmp();
}

const insertarRegistro = (req, res) => {
    async function agendarCita(data) {
        try {
            let sql = `INSERT INTO agenda (id, fecha_reg, nombre, cedula, edad, genero, telefono, correo, instagram, equipo, categoria, estacion, fecha_cita, hora_cita, concluida) 
            VALUES (${null}, '${new Date().toLocaleString()}', '${data.nombre}', '${data.cedula}', ${data.edad}, '${data.genero}', '${data.telefono}', '${data.correo}', '${data.instagram}', '${data.equipo}', '${data.categoria}', '${data.estacion}', '${data.fecha_cita}', '${data.hora_cita}', 0)`;

            [rows, metadata] = await conn.query(sql);

            res.status(200);
            res.json({ row: rows, metadata: metadata });
            res.end();

            return [metadata, data];

        } catch (error) {
            res.status(500);
            res.send(error.name)
        }
    }

    agendarCita(req.body)
        .then(res => {
            let tmp = new FormData();

            tmp.append("nombre", res[1].nombre);
            tmp.append("cedula", res[1].cedula);
            tmp.append("telefono", res[1].telefono);
            tmp.append("fecha_cita", res[1].fecha_cita);
            tmp.append("hora_cita", res[1].hora_cita);
            tmp.append("estacion", res[1].estacion);
            tmp.append("correo", res[1].correo);

            let data = new URLSearchParams(tmp).toString();

            // Enviar correo de registro al usuario
            if (res[0] == 1) {
                fetch("https://liorcosmetics.com/agendaArnicaEmailAPI.php?correoRegistro=true", { method: "post", body: data, headers: { "Content-Type": "application/x-www-form-urlencoded;charset=UTF-8" } })
                    .then(res => res.json())
                    .then(res => {
                        console.log(res);
                    })
            }
        });
}

const concluirCita = (req, res) => {
    async function finalizarCita() {
        try {
            [rows, metadata1] = await conn.query(`UPDATE agenda SET concluida = 1 WHERE id = ${req.params.id} AND cedula = '${req.params.cedula}'`);
            [row, metadata2] = await conn.query(`SELECT nombre, correo FROM agenda WHERE id = ${req.params.id} AND cedula = '${req.params.cedula}'`);

            res.header("content-type", "application/json");
            res.json({ stmt: true });
            res.end();

            return [metadata1.changedRows, row[0].nombre, row[0].correo];

        } catch (error) {
            res.status(500);
            res.send(error.name);
            res.end();
        }
    }

    finalizarCita()
        .then(res => {
            let tmp = new FormData();
            tmp.append("nombre", res[1]);
            tmp.append("correo", res[2]);

            let data = new URLSearchParams(tmp).toString();

            // Enviar correo de registro al usuario
            if (res[0] == 1) {
                fetch("https://liorcosmetics.com/agendaArnicaEmailAPI.php?correoFinal=true", { method: "post", body: data, headers: { "Content-Type": "application/x-www-form-urlencoded;charset=UTF-8" } })
                    .then(res => res.json())
                    .then(res => {
                        console.log(res);
                    })
            }
        });

}

module.exports = {
    landingPage,
    vistaFormulario,
    insertarRegistro,
    vistaTabla,
    consultarRegistros,
    concluirCita,
    horariosNoDisponibles
}