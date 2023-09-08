const APP = require("express")();
const { conn, connTest } = require("../sequelize");
const PATH = require("path");
const URL = require("url");
const FS = require("fs");
data = JSON.parse(FS.readFileSync("./config/config.json", "utf8"));

// MIDD

// VISTAS
const landingPage = (req, res) => {
    res.status(200);
    res.header("content-type", "text/html");
    res.render("index", { server: data[0].server });
}

const vistaFormulario = (req, res) => {
    async function tmp() {
        try {
            [hrAtencion, metadata] = await conn.query("SELECT desde, hasta FROM horario_atencion WHERE id = 1");
            [estaciones, metadata] = await conn.query("SELECT * FROM estaciones WHERE estatus = 'activo'");
            [horarios, metadata] = await conn.query(`SELECT * FROM horarios WHERE estatus = 'activo' AND hora BETWEEN '${hrAtencion[0].desde}' AND '${hrAtencion[0].hasta}'`);
            res.status(200);
            res.header("content-type", "text/html");
            res.render("data-entry", { estaciones: estaciones, horarios: horarios, server: data[0].server });
        } catch (error) {
            res.status(500);
            res.send(error.name);
            res.end();
        }
    }

    tmp();

}

const vistaTabla = (req, res) => {
    async function tmp() {
        try {
            [agenda, metadata] = await conn.query("SELECT * FROM agenda");
            [evt, metadata] = await conn.query("SELECT * FROM eventos");
            [est, metadata] = await conn.query("SELECT * FROM estaciones");
            [hrs, metadata] = await conn.query("SELECT * FROM horarios");
            res.status(200);
            res.header("content-type", "text/html");
            res.render("data-query", { server: data[0].server, eventos: evt, estaciones: est, horarios: hrs, registros: agenda });
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

const actualizarEstatusEstaciones = (req, res) => {
    let estatus = req.params.st;
    let id = req.params.id;

    async function tmp() {
        try {
            await conn.query(`UPDATE estaciones SET estatus='${estatus}' WHERE id = '${id}'`);
            [rows, metadata] = await conn.query("SELECT * FROM estaciones");
            res.header("content-type", "application/json");
            res.json({ stmt: true });
            res.end();
        } catch (error) {
            res.status(500);
            res.send(error.name);
            res.end();
        }
    }
    tmp();
}

const eventoActivo = (req, res) => {
    async function tmp() {
        try {
            [rows, metadata] = await conn.query("SELECT * FROM eventos WHERE estatus = 'En curso'");
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

const agregarEvento = (req, res) => {
    async function tmp() {
        let data = req.body;
        let fechaActual = new Date(Date.now()).toISOString().split("T")[0];
        try {
            // Agregar nuevo evento
            await conn.query(`INSERT INTO eventos SET id = null, descripcion='${data.evtdesc}', fecha_ini='${data.evtfecini}', fecha_fin='${data.evtfecfin}', estatus='En curso'`);

            // Actualizar estatus de eventos pasados
            await conn.query(`UPDATE eventos SET estatus='Finalizado' WHERE fecha_fin < '${fechaActual}'`);

            // Consultar eventos para enviar actualizaciones
            [rows, metadata] = await conn.query("SELECT * FROM eventos");

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

const eliminarEvento = (req, res) => {
    async function tmp() {
        let id = req.params.id
        try {
            await conn.query(`DELETE FROM eventos WHERE id = ${id}`);
            [rows, metadata] = await conn.query("SELECT * FROM eventos");
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

const agregarEstacion = (req, res) => {
    let estacion = req.body.estacion;
    let img = req.file;
    console.log(estacion, img);
    res.json({ stmr: true });

    async function tmp() {
        try {
            await conn.query(`INSERT INTO estaciones SET id = 'NULL', descripcion='${estacion}', estatus='activo'`);
            [rows, metadata] = await conn.query("SELECT * FROM estaciones");
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

const horarioAtencion = (req, res) => {
    let desde = req.body.desde;
    let hasta = req.body.hasta;

    async function tmp() {
        try {
            await conn.query(`UPDATE horario_atencion SET desde='${desde}', hasta='${hasta}' WHERE id= 1`);
            res.header("content-type", "application/json");
            res.json({ stmt: true });
            res.end();
        } catch (error) {
            res.status(500);
            res.send(error.name);
            res.end();
        }
    }
    tmp();
}

const eliminarEstacion = (req, res) => {
    async function tmp() {
        let id = req.params.id
        try {
            // Eliminar imagen de la estacion
            [row, metadata] = await conn.query(`SELECT descripcion FROM estaciones WHERE id = ${id}`);
            let archivo = row[0].descripcion.replaceAll(" ", "_") + ".jpg";
            FS.existsSync(`public/img/${archivo}`) ? FS.unlinkSync(`public/img/${archivo}`) : null;

            // Eliminar estacion de la bd
            await conn.query(`DELETE FROM estaciones WHERE id = ${id}`);

            [rows, metadata] = await conn.query("SELECT * FROM estaciones");
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
            let sql = `INSERT INTO agenda (id, fecha_reg, nombre, cedula, edad, genero, estado, ciudad, telefono, correo, instagram, evento, equipo, categoria, estacion, fecha_cita, hora_cita, concluida) 
            VALUES (${null}, '${new Date().toLocaleString()}', '${data.nombre}', '${data.cedula}', ${data.edad}, '${data.genero}', '${data.estado}', '${data.ciudad}', '${data.telefono}', '${data.correo}', '${data.instagram}', '${data.evento}', '${data.equipo}', '${data.categoria}', '${data.estacion}', '${data.fecha_cita}', '${data.hora_cita}', 0)`;

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
    horariosNoDisponibles,
    eventoActivo,
    agregarEvento,
    eliminarEvento,
    agregarEstacion,
    eliminarEstacion,
    actualizarEstatusEstaciones,
    horarioAtencion
}