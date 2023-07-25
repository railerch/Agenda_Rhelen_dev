const EXPRESS = require("express");
const ROUTER = EXPRESS.Router();
const CTRL = require("../controllers/registros-ctrl");

ROUTER.get("/", CTRL.landingPage);
ROUTER.get("/dataentry", CTRL.vistaFormulario);
ROUTER.get("/dataquery", CTRL.vistaTabla);
ROUTER.get("/concluir-cita/:id/:cedula", CTRL.concluirCita);
ROUTER.get("/horarios/:fechaCita/:estacion", CTRL.horariosNoDisponibles);
ROUTER.get("/get", CTRL.consultarRegistros);
ROUTER.post("/post", CTRL.insertarRegistro);

module.exports = ROUTER;