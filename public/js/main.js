import * as fn from "./main-fn.js";
let server = "";

window.onload = () => {

    // FORMULARIO DE REGISTRO
    if (window.location.pathname.includes("/dataentry")) {
        // LIMPIAR EL SESIONSTORAGE
        sessionStorage.clear();

        // SELECCIONAR EVENTO PARA FIJAR LAS FECHAS DE ATENCION
        document.getElementById("evento-list").addEventListener("change", function () {
            if (this.value == "") {
                document.querySelector("select[name=estacion]").setAttribute("disabled", true);
                document.querySelectorAll(".estacion-img").forEach(img => img.setAttribute("src", `${server}/img/sinEstacion.jpg`))
            } else {
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
                        document.querySelector("select[name=estacion]").removeAttribute("disabled");
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


                    }).catch(err => $("#error-modal").modal("show"))
            }

            // Reiniciar valores
            document.querySelector("select[name=estacion]").value = ""
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

            if (this.value != "") {
                fechaCita.removeAttribute("disabled");

                // Cambiar imagen de la estacion
                let imagen = `${this.value.replaceAll(" ", "_")}.jpg`;
                let alt = this.value;
                document.querySelectorAll(".estacion-img").forEach(img => {
                    img.setAttribute("src", `${server}/img/${imagen}`);
                    img.setAttribute("alt", alt);
                })
            } else {
                fechaCita.setAttribute("disabled", true);
                horaCita.setAttribute("disabled", true);
                document.querySelectorAll(".estacion-img").forEach(img => {
                    img.setAttribute("src", `${server}/img/sinEstacion.jpg`);
                    img.setAttribute("alt", "Debe seleccionar una estacion.");
                })
            }

        })

        // CONSULTAR HORARIOS DISPONIBLES AL CAMBIAR LA FECHA LA CUAL DEBE ESTAR EN EL RANGO DE FECHA DEL EVENTO
        document.querySelector("input[name=fecha-cita]").addEventListener("change", function () {
            let evt = document.querySelector("select[name=evento]");
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

                // Consultar horarios disponibles segun la fecha
                fetch(`${server}/horarios-no-disponibles/${evt.value}/${this.value}/${estacion.value}`)
                    .then(res => res.json())
                    .then(res => {
                        // Deshabilitar horarios no disponibles en selector de hora_cita
                        for (let opt of horaCitaOpt) {
                            res.forEach(hr => {
                                if (hr.hora_no_disponible == opt.value) {
                                    opt.setAttribute("disabled", true);
                                    opt.style.color = "red";
                                }
                            })
                        };

                    }).catch(err => {
                        $("#error-modal").modal("show")
                        horaCita.setAttribute("disabled", true);
                    })

                // Consultar hora de descanso
                fetch(`${server}/consultar-descanso/${evt.value}/${estacion.value}`)
                    .then(res => res.json())
                    .then(res => {
                        // Deshabilitar hora y marcar con un color diferente a los
                        // horarios no disponibles
                        for (let opt of horaCitaOpt) {
                            res.forEach(descanso => {
                                if ((opt.value == descanso.desde || opt.value > descanso.desde) && opt.value <= descanso.hasta) {
                                    opt.setAttribute("disabled", true);
                                    opt.style.color = "blue";
                                }
                            })
                        };

                    }).catch(err => $("#error-modal").modal("show"))
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
                            }).catch(err => $("#error-modal").modal("show"))

                        break;
                }
                fn.preloader(false);
            })
        })

        // BUSCAR DATOS DE USUARIOS REGISTRADOS EN EVENTOS PREVIOS
        // Una vez ingresen su numero de cedula se completan 
        document.getElementById("cedula").addEventListener("blur", function () {
            if (this.value.match(/[0-9]{7,}/) && this.value.length <= 8) {
                fn.preloader();
                let cedula = this.value;
                fetch(`${server}/buscar-usuario/${cedula}`)
                    .then(res => res.json())
                    .then(res => {
                        // Completar campos del formulario con los datos del usuario si existen
                        let cols = ["categoria", "cedula", "ciudad", "correo", "disciplina", "edad", "equipo", "estado", "genero", "instagram", "nombre", "telefono"];
                        if (res.length > 0) {
                            cols.forEach(col => document.querySelector(`[name=${col}]`).value = res[0][col]);
                        } else {
                            cols.forEach(col => {
                                if (col != "cedula") document.querySelector(`[name=${col}]`).value = "";
                            })
                        }

                        // Habilitar campos del formulario
                        document.querySelectorAll("#datos-registro-frm input, #datos-registro-frm select")
                            .forEach(el => el.removeAttribute("disabled"))

                        // Ocultar preloader
                        setTimeout(function () {
                            fn.preloader(false);
                        }, 500)
                    }).catch(err => {
                        // Ocultar preloader y mostrar modal de error
                        setTimeout(function () {
                            fn.preloader(false);
                            $("#error-modal").modal("show");
                        }, 500)
                    })
            } else {
                if (this.value != "") {
                    $("#cedula-invalida-modal").modal("show");
                }

                this.value = "";
                // Inhabilitar y reiniciar campos del formulario
                document.querySelectorAll("#datos-registro-frm input, #datos-registro-frm select")
                    .forEach(el => {
                        if (el.id != "cedula") {
                            el.setAttribute("disabled", true);
                            el.value = "";
                        };
                    })

            }
        })
    }

    // SISTEMA DE GESTION
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
                    })
            })
        })

        // Agregar nuevo evento
        document.getElementById("nuevo-evento-frm").addEventListener("submit", function (evt) {
            evt.preventDefault();
            let procesar = true;

            // Validar que los campos no esten vacios
            Array.from(this.elements).forEach(el => {
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
                    .catch(err => $("#error-modal").modal("show"))
            } else {
                $("#campos-vacios-modal").modal("show");
            }
        })

        // Agregar nueva estacion
        document.getElementById("nueva-estacion-frm").addEventListener("submit", function (evt) {
            evt.preventDefault();

            if (document.getElementById("estacion-descripcion").value != "" && document.getElementById("estacion-img").value != "") {
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
                    .catch(err => $("#error-modal").modal("show"))
            } else {
                $("#campos-vacios-modal").modal("show");
            }
        })

        // Modificar estacion
        document.querySelectorAll(".modificar-est-btn").forEach(btn => {
            btn.addEventListener("click", function (evt) {
                let idReg = this.getAttribute("data-id")

                fetch(`${server}/consultar-estacion/${idReg}`)
                    .then(res => res.json())
                    .then(res => {
                        document.getElementById("confirmar-modificar-est-btn").setAttribute("data-id", idReg);
                        document.getElementById("nueva-est-descripcion").value = res[0].descripcion;
                    })
                    .catch(err => $("#error-modal").modal("show"))
            })
        })

        document.getElementById("confirmar-modificar-est-btn").addEventListener("click", function () {
            if (document.getElementById("nueva-est-descripcion").value != "") {
                let idReg = this.getAttribute("data-id");
                let data = new FormData(document.getElementById("modificar-estacion-frm"));

                fetch(`${server}/modificar-datos-estacion/${idReg}`, { method: "post", body: data })
                    .then(res => res.json())
                    .then(res => {
                        $("#exito-modal").modal("show");
                        document.getElementById("modificar-estacion-frm").reset();
                        setTimeout(function () {
                            window.location.reload();
                        }, 1500)
                    })
                    .catch(err => $("#error-modal").modal("show"))
            } else {
                $("#campos-vacios-modal").modal("show");
            }
        })

        // Consultar estaciones y horarios segun el evento
        document.getElementById("descanso-eventos").addEventListener("change", function () {
            let estacionesEvento = document.getElementById("descanso-estaciones");
            let horarioDescanso = document.querySelectorAll(".descanso-horario");
            let evtId = this.options[this.selectedIndex].getAttribute("data-evt-id");
            let horaIni = this.options[this.selectedIndex].getAttribute("data-hora-ini");
            let horaFin = this.options[this.selectedIndex].getAttribute("data-hora-fin");

            if (this.value == "") {
                estacionesEvento.value = "";
                estacionesEvento.setAttribute("disabled", true);
                horarioEvento.value = "";
                horarioEvento.setAttribute("disabled", true);
            } else {
                estacionesEvento.removeAttribute("disabled");
                horarioDescanso.forEach(hr => hr.removeAttribute("disabled"))

                // Consultar horario y estaciones de atencion segun el evento seleccionado
                fetch(`${server}/estaciones-horario-evento-seleccionado/${evtId}/${horaIni}/${horaFin}`)
                    .then(res => res.json())
                    .then(res => {
                        // Estaciones
                        estacionesEvento.innerHTML = "<option value=''>Seleccionar</option>";
                        res.estaciones.forEach(est => {
                            let opt = document.createElement("option");
                            opt.innerText = est.descripcion;
                            opt.value = est.descripcion;
                            estacionesEvento.append(opt);
                        })

                        // Horario
                        horarioDescanso.forEach(selector => {
                            selector.innerHTML = "<option value=''>Seleccionar</option>";
                            res.horario.forEach(hr => {
                                let opt = document.createElement("option");
                                opt.innerText = hr.hora
                                opt.value = hr.hora;
                                selector.append(opt);
                            })
                        })
                    }).catch(err => $("#error-modal").modal("show"))
            }
        })

        // Asignar descanso a estaciones
        document.getElementById("nuevo-descanso-frm").addEventListener("submit", function (evt) {
            evt.preventDefault();
            let enviar = true;

            // Validar que los campos no esten vacios
            Array.from(this.elements).forEach(node => {
                if (node.nodeName == "SELECT" && node.value == "") enviar = false
            });

            if (enviar) {
                let data = new URLSearchParams(new FormData(this)).toString();

                fetch(`${server}/agregar-descanso`, { method: "post", body: data, headers: { "content-type": "application/x-www-form-urlencoded;charset=UTF-8" } })
                    .then(res => res.json())
                    .then(res => {
                        $("#exito-modal").modal("show");
                        document.getElementById("nuevo-descanso-frm").reset();
                        setTimeout(function () {
                            window.location.reload();
                        }, 1500)
                    })
                    .catch(err => $("#error-modal").modal("show"))
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
                .catch(err => $("#error-modal").modal("show"))
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
                case "descansos":
                    ruta = "eliminar-descanso";
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

                }).catch(err => $("#error-modal").modal("show"))
        })

        // Alinear cabeceras de tablas al activar el contenedor del acordeon

        /*
        CITA:
        It isn't a bug, but rather happens because the table is initialised when it is hidden. 
        As a result of that the elements inside the hidden container have no height or width 
        and therefore no responsive calculations are possible.What needs to happen is to call 
        columns.adjust() when the table is made visible.
         
        */
        document.querySelectorAll(".accordion-header").forEach(btn => {
            btn.addEventListener("click", function () {
                $($.fn.dataTable.tables(true)).DataTable().columns.adjust()
            })
        })

        // Inicializar tablas
        let tablas = ["#eventos-tbl", "#estaciones-tbl", "#descansos-tbl"];
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