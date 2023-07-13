import * as fn from "./main-fn.js";
let serverAPI = "http://10.80.35.24:8000";

window.onload = () => {
    // FORMULARIO DE REGISTRO
    if (window.location.pathname.includes("/dataentry")) {
        // AVANCE Y RETORNO ENTRE PANTALLAS
        fn.preloader();
        sessionStorage.setItem("pantallaActual", 1);
        document.querySelector("div[data-paso='1']").style.visibility = "visible";
        document.querySelector("div[data-screen='1']").style.display = "block";
        fn.preloader(false);

        document.querySelectorAll(".control-btn").forEach(btn => {
            btn.addEventListener("click", function () {
                fn.preloader();
                let accion = this.getAttribute("data-direction");
                let pantAct = parseInt(sessionStorage.getItem("pantallaActual"));
                let next;

                // Cambiar pantalla segun la accion
                switch (accion) {
                    case "atras":
                        next = pantAct == 1 ? pantAct : pantAct - 1;
                        if (next == 1) {
                            btn.style.display = "none";
                        } else if (next == 2) {
                            document.getElementById("finalizar-btn").style.display = "none"
                            document.getElementById("adelante-btn").style.display = "inline"
                        }

                        fn.mostrarOcultarPantallas(pantAct, next);
                        sessionStorage.setItem("pantallaActual", next);
                        break;
                    case "adelante":
                        next = pantAct == 4 ? pantAct : pantAct + 1;
                        if (next == 3) {
                            btn.style.display = "none";

                            // Mostrar datos para validacion visual por parte del usuario
                            fn.datos_de_registro();
                        } else if (next == 2) {
                            document.getElementById("atras-btn").style.display = "inline"
                            document.getElementById("adelante-btn").style.display = "inline"
                            document.getElementById("finalizar-btn").style.display = "none"
                        }

                        fn.mostrarOcultarPantallas(pantAct, next);
                        sessionStorage.setItem("pantallaActual", next);
                        break;
                    case "finalizar":
                        // Registrar datos de cita en BD
                        let tmp = JSON.parse(sessionStorage.getItem("datosRegistro"));
                        let datos = new URLSearchParams(tmp).toString();

                        fetch(`${serverAPI}/post`, { method: "post", body: datos, headers: { "Content-type": "application/x-www-form-urlencoded;charset=UTF-8" } })
                            .then(res => res.json())
                            .then(res => {
                                next = 4;
                                fn.mostrarOcultarPantallas(pantAct, next);
                                sessionStorage.setItem("pantallaActual", next);
                                sessionStorage.removeItem("datosRegistro");

                                btn.style.display = "none";
                                document.getElementById("atras-btn").style.display = "none";
                                document.getElementById("adelante-btn").style.display = "none";
                                document.getElementById("pagina-principal-btn").style.display = "inline";
                            }).catch(err => {
                                console.log("HA OCURRIDO UN ERROR: " + err);
                            })

                        break;
                }
                fn.preloader(false);
            })
        })

        // ALMACENAR DATOS CONFORME SE INGRESAN EN PANTALLA
        // Generar un conjunto de datos que este activo durante el llenado del formulario para al finalizar insertarlos en la BD
        let dataSet = new Map()
        document.querySelectorAll("input, select").forEach(el => {
            el.addEventListener("blur", function () {
                let key = this.getAttribute("name").replace("-", "_");
                let val = this.value;
                dataSet.set(`${key}`, val);
                sessionStorage.setItem("datosRegistro", JSON.stringify(Object.fromEntries(dataSet)));
            })
        })

        // CAMBIAR IMAGEN / CONSULTAR FECHAS Y HORARIOS DISPONIBLES AL CAMBIAR DE ESTACION
        document.querySelector("select[name=estacion]").addEventListener("change", function () {
            // Restaurar campos
            document.querySelector("input[name=fecha-cita]").value = "";
            document.querySelector("select[name=hora-cita]").value = "";

            // Eliminar fecha y hora del dataSet generado
            dataSet.delete("fecha_cita");
            dataSet.delete("hora_cita");

            // Cambiar imagen de la estacion
            let estacionImg = document.getElementById("estacion-img");
            let imagen = `${this.value.replaceAll(" ", "_")}.jpg`;
            estacionImg.setAttribute("src", `img/${imagen}`);
            estacionImg.setAttribute("alt", this.value);
        })

        // CONSULTAR HORARIOS DISPONIBLES AL CAMBIAR LA FECHA
        document.querySelector("input[name=fecha-cita]").addEventListener("change", function () {
            document.querySelector("select[name=hora-cita]").value = "";

            // Eliminar hora del dataSet generado
            dataSet.delete("hora_cita");
        })
    }

    // TABLA DE REGISTROS
    if (window.location.pathname.includes("/dataquery")) {
        // Usar Cookies
        document.cookie.split(";").forEach(cookie => {
            if (!cookie.includes("agendaRhelen")) {
                let exp = new Date(Date.now() + (86400000 * 3)).toUTCString();
                document.cookie = `username=Admin;expires=${exp};path=/`;
                document.cookie = `site=agendaRhelen;expires=${exp};path=/`;
            } else {
                console.info("Cookies already set.");
            }
        })

        // Datatables
        $(".table").DataTable({
            scrollX: true,
            "language": {
                "url": "//cdn.datatables.net/plug-ins/1.13.1/i18n/es-ES.json"
            },
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'excel',
                    text: '<p class="icon-table m-0">Excel</p>',
                    titleAttr: 'Exportar a excel',
                    messageTop: 'Registro de citas.',
                    exportOptions: {
                        columns: ":visible"
                    }
                },
                {
                    extend: 'print',
                    text: '<p class="icon-print m-0">Imprimir</p>',
                    titleAttr: 'Imprimir',
                    messageTop: 'Registro de citas.',
                    exportOptions: {
                        columns: ":visible"
                    }
                },
                "colvis"
            ]
        });

        // Login de acceso a los registros
        $("#login-modal").modal("show");
        document.getElementById("admin-login-btn").addEventListener("click", function () {
            let campos = document.getElementById("admin-login-frm").elements;
            let aviso = document.getElementById("login-err-alert");

            if (campos.usuario.value.toLowerCase() == "admin" && campos.clave.value == "admin123.") {
                $("#login-modal").modal("hide");
            } else {
                aviso.style.display = "block";
                setTimeout(() => {
                    aviso.style.display = "none";
                }, 2000)
            }
        })
    }
}