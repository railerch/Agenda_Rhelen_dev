import * as fn from "./main-fn.js";
let server = "http://arnica.dnsalias.com:8000";

window.onload = () => {

    // FORMULARIO DE REGISTRO
    if (window.location.pathname.includes("/dataentry")) {
        // LIMPIAR EL SESIONSTORAGE
        sessionStorage.clear();

        // SELECCIONAR EVENTO PARA FIJAR LAS FECHAS DE ATENCION
        document.getElementById("evento-list").addEventListener("change", function () {
            if (this.value == "") {
                document.querySelector("select[name=estacion]").setAttribute("disabled", true);
            } else {
                document.querySelector("select[name=estacion]").removeAttribute("disabled");

                let evento = this.value;
                let eventoId, fecIni, fecFin, evtInicio, evtCierre;

                eventoId = this.options[this.selectedIndex].getAttribute("data-evt-id");
                fecIni = this.options[this.selectedIndex].getAttribute("data-fecha-ini");
                fecFin = this.options[this.selectedIndex].getAttribute("data-fecha-fin");
                evtInicio = this.options[this.selectedIndex].getAttribute("data-evt-inicio");
                evtCierre = this.options[this.selectedIndex].getAttribute("data-evt-cierre");

                sessionStorage.setItem("evtFecha", JSON.stringify({ evento, fecIni, fecFin }));

                // Consultar horario y estaciones de atencion segun el evento seleccionado
                fetch(`${server}/estaciones-horario-evento-seleccionado/${eventoId}/${evtInicio}/${evtCierre}`)
                    .then(res => res.json())
                    .then(res => {
                        // Estaciones
                        let estacionesEvento = document.querySelector("select[name=estacion]");
                        estacionesEvento.innerHTML = "<option value=''>Seleccionar estación</option>";
                        res.estaciones.forEach(est => {
                            let opt = document.createElement("option");
                            opt.innerText = est.descripcion;
                            opt.value = est.descripcion;
                            estacionesEvento.append(opt);
                        })

                        // Horario
                        let horarioEvento = document.querySelector("select[name=hora-cita]");
                        horarioEvento.innerHTML = "<option value=''>Hora de su cita</option>";
                        res.horario.forEach(hr => {
                            let opt = document.createElement("option");
                            opt.innerText = hr.hora
                            opt.value = hr.hora;
                            opt.style.color = "green";
                            horarioEvento.append(opt);
                        })


                    }).catch(err => console.log("HA OCURRIDO UN ERROR: " + err))
            }

            // Reiniciar valores
            dataSet.clear();
            document.querySelector("select[name=estacion]").value = "sinEstacion"
            document.querySelector("select[name=estacion]").innerHTML = "<option value=''>Seleccionar estación</option>";
            document.querySelector("input[name=fecha-cita]").setAttribute("disabled", true);
            document.querySelector("input[name=fecha-cita]").value = "";
            document.querySelector("select[name=hora-cita]").setAttribute("disabled", true);
            document.querySelector("select[name=hora-cita]").innerHTML = "<option value=''>Hora de su cita</option>";
        })

        // CAMBIAR IMAGEN / CONSULTAR FECHAS Y HORARIOS DISPONIBLES AL CAMBIAR DE ESTACION
        document.querySelector("select[name=estacion]").addEventListener("change", function () {
            let fechaCita = document.querySelector("input[name=fecha-cita]");
            let horaCita = document.querySelector("select[name=hora-cita]");

            // Restaurar campos
            fechaCita.value = "";
            horaCita.value = "";
            horaCita.setAttribute("disabled", true);

            // Eliminar fecha y hora del dataSet generado
            dataSet.delete("fecha_cita");
            dataSet.delete("hora_cita");

            if (this.value != "sinEstacion") {
                fechaCita.removeAttribute("disabled");

                // Cambiar imagen de la estacion
                let imagen = `${this.value.replaceAll(" ", "_")}.jpg`;
                let alt = this.value;
                document.querySelectorAll(".estacion-img").forEach(el => {
                    el.setAttribute("src", `${server}/img/${imagen}`);
                    el.setAttribute("alt", alt);
                })
            } else {
                fechaCita.setAttribute("disabled", true);
                horaCita.setAttribute("disabled", true);
                document.querySelectorAll(".estacion-img").forEach(el => {
                    el.setAttribute("src", `${server}/img/sinEstacion.jpg`);
                    el.setAttribute("alt", "Debe seleccionar una estacion.");
                })
            }

        })

        // CONSULTAR HORARIOS DISPONIBLES AL CAMBIAR LA FECHA LA CUAL DEBE ESTAR EN EL RANGO DE FECHA DEL EVENTO
        document.querySelector("input[name=fecha-cita]").addEventListener("change", function () {
            let estacion = document.querySelector("select[name=estacion]");
            let horaCita = document.querySelector("select[name=hora-cita]");
            let horaCitaOpt = document.querySelectorAll("select[name=hora-cita] option");

            // Limitar fechas de atencion
            let evento = JSON.parse(sessionStorage.getItem("evtFecha"));
            let tmp = new Date().toLocaleString().split(",")[0].split("/");
            let mm = tmp[1] >= 10 ? tmp[1] : `0${tmp[1]}`;
            let dd = tmp[0] >= 10 ? tmp[0] : `0${tmp[0]}`;
            let hoy = Date.parse(`${tmp[2]}-${mm}-${dd}`);
            let fecInicio = Date.parse(evento.fecIni);
            let fecLimite = Date.parse(evento.fecFin);
            let fecSelec = Date.parse(this.value);

            if (fecSelec < hoy || fecSelec < fecInicio || fecSelec > fecLimite) {
                document.querySelector("#limite-fecha-modal #fecha-ini").innerText = evento.fecIni;
                document.querySelector("#limite-fecha-modal #fecha-fin").innerText = evento.fecFin;
                $("#limite-fecha-modal").modal("show");
                this.value = "";

                // Eliminar hora y fecha del dataSet generado
                dataSet.delete("fecha_cita");
                this.value = "";
                dataSet.delete("hora_cita");
                horaCita.value = "";
                horaCita.setAttribute("disabled", true);
            } else {
                horaCita.value = "";
                horaCita.removeAttribute("disabled");

                for (let opt of horaCitaOpt) {
                    if (opt.value != "") {
                        opt.removeAttribute("disabled");
                        opt.style.color = "green";
                    }
                };

                // Eliminar hora del dataSet generado
                dataSet.delete("hora_cita");

                // Consultar horarios disponibles segun la fecha
                fetch(`${server}/horarios/${this.value}/${estacion.value}`)
                    .then(res => res.json())
                    .then(res => {
                        // Obtener horarios no disponibles
                        let hrNoDisp = [];
                        res.forEach(hr => {
                            hrNoDisp.push(hr.hora_no_disponible);
                        })

                        // Deshabilitar horarios no disponibles en selector de hora_cita
                        for (let opt of horaCitaOpt) {
                            hrNoDisp.forEach(hr => {
                                if (hr.includes(opt.value) && opt.value != "") {
                                    opt.setAttribute("disabled", true);
                                    opt.style.color = "red";
                                }
                            })
                        };

                    }).catch(err => console.log("HA OCURRIDO UN ERROR: " + err))
            }
        })

        // AVANCE Y RETORNO ENTRE PANTALLAS / REGISTRAR CITA
        sessionStorage.removeItem("datosRegistro");
        sessionStorage.setItem("pantallaActual", 1);
        document.querySelector("div[data-paso='1']").style.visibility = "visible";
        document.querySelector("div[data-screen='1']").style.display = "block";

        document.querySelectorAll(".control-btn").forEach(btn => {
            btn.addEventListener("click", function () {
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
                            document.getElementById("finalizar-btn").style.display = "none";
                            document.getElementById("adelante-btn").style.display = "inline";
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
                        let datos = new URLSearchParams(JSON.parse(sessionStorage.getItem("datosRegistro"))).toString();
                        fn.preloader();
                        fetch(`${server}/post`, { method: "post", body: datos, headers: { "Content-type": "application/x-www-form-urlencoded;charset=UTF-8" } })
                            .then(res => res.json())
                            .then(res => {
                                /*La ventana modal con el preloader.gif tarda 300ms en activarse, si se trata de desactivar
                               antes de este tiempo quedara activa y bloqueara la interaccion con el formulario*/
                                setTimeout(() => {
                                    next = 4;
                                    fn.preloader(false);
                                    fn.mostrarOcultarPantallas(pantAct, next);
                                    sessionStorage.setItem("pantallaActual", next);
                                    sessionStorage.removeItem("datosRegistro");

                                    btn.style.display = "none";
                                    document.getElementById("atras-btn").style.display = "none";
                                    document.getElementById("adelante-btn").style.display = "none";
                                    document.getElementById("pagina-principal-btn").style.display = "inline";
                                }, 500)
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
    }

    // TABLA DE REGISTROS
    if (window.location.pathname.includes("/dataquery")) {
        // Validar Cookies
        let recordarCuenta = document.getElementById("recordar-cuenta-chk");
        let user = document.getElementById("usuario");
        let pass = document.getElementById("clave");

        if (document.cookie.includes("agendaRhelen")) {
            document.cookie.split(";").forEach(cookie => {
                if (cookie.includes("user&Pass")) {
                    let data = cookie.split("=")[1].split("/");
                    user.value = data[0];
                    pass.value = data[1];
                }
            })
            document.getElementById("recordar-cuenta-chk").checked = true;
            document.getElementById("recordar-cuenta-chk").removeAttribute("disabled");
            console.info("Cookies already set.");
        }

        // Validar campos para activar el checkbox - Recordar cuenta
        user.addEventListener("blur", function () {
            if (this.value != "" && pass.value != "") {
                recordarCuenta.removeAttribute("disabled");
            } else {
                recordarCuenta.setAttribute("disabled", true);
            }
        });

        pass.addEventListener("blur", function () {
            if (this.value != "" && user.value != "") {
                recordarCuenta.removeAttribute("disabled");
            } else {
                recordarCuenta.setAttribute("disabled", true);
            }
        });

        // Activar checkbox para recordar datos del usuario
        recordarCuenta.addEventListener("click", function () {
            if (this.checked) {
                fn.crearCookie(user.value, pass.value, 30);
                console.log("Recordar cuenta...");
            } else {
                fn.crearCookie(null, null, 0);
                console.log("Olvidar cuenta...");
            }
        })

        // Login
        if (!sessionStorage.getItem("sesionAuth")) {
            sessionStorage.clear();
            $("#login-modal").modal("show");

            document.getElementById("admin-login-btn").addEventListener("click", function () {
                let campos = document.getElementById("admin-login-frm").elements;
                let aviso = document.getElementById("login-err-alert");

                if (campos.usuario.value.toLowerCase() == "admin" && campos.clave.value == "admin123.") {
                    $("#login-modal").modal("hide");
                    sessionStorage.setItem("sesionAuth", true);
                } else {
                    aviso.style.display = "block";
                    setTimeout(() => {
                        aviso.style.display = "none";
                    }, 2000)
                }

            })
        }

        // Logout
        document.getElementById("cerrar-sesion-btn").addEventListener("click", function () {
            sessionStorage.clear();
            window.location.reload();
        })

        // Marcar cita como finalizada por el admin
        document.querySelectorAll(".concluir-cita-btn").forEach(btn => {
            btn.addEventListener("click", function () {
                fn.preloader();
                let btnTmp = this;
                let rengId = this.getAttribute("data-reng");
                let cedula = this.getAttribute("data-cedula");
                fetch(`${server}/concluir-cita/${rengId}/${cedula}`)
                    .then(res => res.json())
                    .then(res => {
                        if (res.stmt) {
                            setTimeout(() => {
                                fn.preloader(false);
                                btnTmp.parentElement.innerHTML = '<i class="bi bi-check-lg text-success" alt="Cita concluida" style="font-size:2em"></i>';
                            }, 500)
                        }
                    }).catch(err => {
                        fn.preloader(false);
                        $("#error-modal").modal("show");
                        console.log("HA OCURRIDO UN ERROR: " + err)
                    })
            })
        })

        // Agregar nuevo evento
        document.getElementById("nuevo-evento-frm").addEventListener("submit", function (evt) {
            evt.preventDefault();
            let procesar = true;
            let inputs = Array.from(this.elements);

            // Validar que los campos no esten vacios
            inputs.forEach(el => {
                if (el.nodeName != "BUTTON" && el.value == "") {
                    procesar = false;
                }
            })

            if (procesar) {
                let data = new URLSearchParams(new FormData(this)).toString();

                fetch(`${server}/agregar-evento`, { method: "post", body: data, headers: { "content-type": "application/x-www-form-urlencoded;charset=UTF-8" } })
                    .then(res => res.json())
                    .then(res => {
                        $("#exito-modal").modal("show");
                        document.getElementById("nuevo-evento-frm").reset();
                        setTimeout(function () {
                            window.location.reload();
                        }, 1500)
                    })
                    .catch(err => {
                        $("#error-modal").modal("show");
                        console.log("HA OCURRIDO UN ERROR: " + err)
                    })
            } else {
                $("#campos-vacios-modal").modal("show");
            }
        })

        // Agregar nueva estacion
        document.getElementById("nueva-estacion-frm").addEventListener("submit", function (evt) {
            evt.preventDefault();

            if (document.getElementById("estacion-descripcion").value != "" && document.getElementById("estacion-img").files[0] != "") {
                let data = new FormData(document.getElementById("nueva-estacion-frm"));

                fetch(`${server}/agregar-estacion`, { method: "post", body: data })
                    .then(res => res.json())
                    .then(res => {
                        $("#exito-modal").modal("show");
                        document.getElementById("nueva-estacion-frm").reset();
                        setTimeout(function () {
                            window.location.reload();
                        }, 1500)
                    })
                    .catch(err => {
                        $("#error-modal").modal("show");
                        console.log("HA OCURRIDO UN ERROR: " + err)
                    })
            } else {
                $("#campos-vacios-modal").modal("show");
            }
        })

        // Modificar horario de atencion
        document.getElementById("horario-estaciones-frm").addEventListener("submit", function (evt) {
            evt.preventDefault();

            let body = new URLSearchParams(new FormData(document.getElementById("horario-estaciones-frm"))).toString();
            console.log(body);

            fetch(`${server}/actualizar-horarios-y-estaciones-evt`, { method: "post", body, headers: { "content-type": "application/x-www-form-urlencoded" } })
                .then(res => res.json())
                .then(res => {
                    $("#exito-modal").modal("show");
                    setTimeout(function () {
                        window.location.reload();
                    }, 1500)
                })
                .catch(err => {
                    $("#error-modal").modal("show");
                    console.log("HA OCURRIDO UN ERROR: " + err)
                })
        })

        // Eliminar registros
        document.querySelectorAll(".eliminar-btn").forEach(btn => {
            btn.addEventListener("click", function () {
                let tipo = this.getAttribute("data-tipo");
                let id = this.getAttribute("data-id");
                sessionStorage.setItem("eliminarReg", JSON.stringify({ tipo, id }));
            })
        })

        document.getElementById("confirmar-eliminar-btn").addEventListener("click", function () {
            let data = JSON.parse(sessionStorage.getItem("eliminarReg"));
            let ruta;

            // Determinar el tipo de dato
            switch (data.tipo) {
                case "eventos":
                    ruta = "eliminar-evento";
                    break;
                case "estaciones":
                    ruta = "eliminar-estacion";
                    break;
                case "cita":
                    ruta = "eliminar-cita";
                    break;
            }

            // Eliminar registro segun el tipo
            fetch(`${server}/${ruta}/${data.id}`)
                .then(res => res.json())
                .then(res => {
                    $("#exito-modal").modal("show");
                    setTimeout(function () {
                        window.location.reload();
                    }, 1500)

                }).catch(err => {
                    $("#error-modal").modal("show");
                    console.log("HA OCURRIDO UN ERROR: " + err);
                })
        })

        // Inicializar tablas
        let tablas = ["#eventos-tbl", "#estaciones-tbl"];
        tablas.forEach(tbl => {
            new DataTable(`${tbl}`, {
                fixedHeader: true,
                info: false,
                searching: false,
                paging: false,
                scrollCollapse: true,
                scrollY: '250px',
                scrollX: true
            })
        })

        // Datatables agenda
        new DataTable("#registros-agenda-tbl", {
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
            ],
            columnDefs: [
                {
                    target: 0,
                    visible: false
                },
                {
                    target: 1,
                    visible: false
                },
                {
                    target: 4,
                    visible: false
                },
                {
                    target: 5,
                    visible: false
                },
                {
                    target: 6,
                    visible: false
                },
                {
                    target: 7,
                    visible: false
                },
                {
                    target: 9,
                    visible: false
                },
                {
                    target: 10,
                    visible: false
                },
                {
                    target: 12,
                    visible: false
                },
                {
                    target: 13,
                    visible: false
                }
            ]
        });
    }
}