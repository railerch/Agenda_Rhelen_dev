const EXPRESS = require("express");
const ROUTER = EXPRESS.Router();
const CTRL = require("../controllers/registros-ctrl");

// MULTER (Cargar archivos)
const MULTER = require("multer");
const storage = MULTER.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'public/img/')
    },
    filename: function (req, file, cb) {
        cb(null, req.body.estacion.replaceAll(" ", "_") + ".jpg");
    }
})
const UPLOAD = MULTER({ storage: storage })

ROUTER.get("/", CTRL.landingPage);
ROUTER.get("/dataentry", CTRL.dataEntry);
ROUTER.get("/dataquery", CTRL.dataQuery);
ROUTER.get("/consultar-estacion/:id", CTRL.consultarEstacion);
ROUTER.post("/agregar-estacion", UPLOAD.single("imagen"), CTRL.agregarEstacion);
ROUTER.post("/modificar-datos-estacion/:id", UPLOAD.single("nueva-imagen"), CTRL.modificarEstacion);
ROUTER.get("/eliminar-estacion/:id", CTRL.eliminarEstacion);
ROUTER.post("/agregar-evento", CTRL.agregarEvento);
ROUTER.get("/estaciones-horario-evento-seleccionado/:id/:inicio/:cierre", CTRL.estacionesHorarioEventoSeleccionado);
ROUTER.post("/actualizar-horarios-y-estaciones-evt", CTRL.actualizarHorariosYestacionesDelEvt);
ROUTER.get("/eliminar-evento/:id", CTRL.eliminarEvento);
ROUTER.get("/buscar-usuario/:cedula", CTRL.buscarUsuario);
ROUTER.post("/agregar-descanso", CTRL.agregarDescanso);
ROUTER.get("/eliminar-descanso/:id", CTRL.eliminarDescanso);
ROUTER.get("/consultar-descanso/:evento/:estacion", CTRL.consultarDescansoEstacion);
ROUTER.get("/concluir-cita/:id/:cedula", CTRL.concluirCita);
ROUTER.get("/horarios-no-disponibles/:evento/:fechaCita/:estacion", CTRL.horariosNoDisponibles);
ROUTER.get("/get", CTRL.consultarRegistros);
ROUTER.post("/post", CTRL.insertarRegistro);
ROUTER.get("/eliminar-cita/:id", CTRL.eliminarRegistro);

module.exports = ROUTER;