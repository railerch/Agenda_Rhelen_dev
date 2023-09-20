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
ROUTER.get("/dataentry", CTRL.vistaFormulario);
ROUTER.get("/dataquery", CTRL.vistaTabla);
ROUTER.get("/eventos-activos", CTRL.eventosActivos);
ROUTER.post("/agregar-evento", CTRL.agregarEvento);
ROUTER.get("/eliminar-evento/:id", CTRL.eliminarEvento);
ROUTER.get("/actualizar-estatus-estaciones/:st/:id", CTRL.actualizarEstatusEstaciones);
ROUTER.post("/agregar-estacion", UPLOAD.single("imagen"), CTRL.agregarEstacion);
ROUTER.post("/modificar-horario-atencion", CTRL.modificarHorarioAtencion);
ROUTER.get("/eliminar-estacion/:id", CTRL.eliminarEstacion);
ROUTER.get("/concluir-cita/:id/:cedula", CTRL.concluirCita);
ROUTER.get("/horarios/:fechaCita/:estacion", CTRL.horariosNoDisponibles);
ROUTER.get("/get", CTRL.consultarRegistros);
ROUTER.post("/post", CTRL.insertarRegistro);

module.exports = ROUTER;