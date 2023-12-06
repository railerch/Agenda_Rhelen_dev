// MODULO DE FUNCIONES

export function preloader(load = true) {
    if (load) {
        $("#preloader-modal").modal("show");
    } else {
        $("#preloader-modal").modal("hide");
    }
}

export function datos_de_registro() {
    // Recolectar los datos introducidos por el usuario
    let contenedor = document.getElementById("datos-para-confirmar");
    contenedor.innerHTML = ""
    let datosTmp = document.querySelectorAll(".form-control, .form-select");
    let datos = {};
    datosTmp.forEach(el => {
        let key = el.getAttribute("name").replaceAll("-", "_")
        datos[`${key}`] = el.value;
    })

    // Almacenar datos para enviar al momento de finalizar el registro
    sessionStorage.setItem("datosRegistro", JSON.stringify(datos));

    // Listar datos para verificacion visual por parte del usuario en pantalla 3
    let ul = document.createElement("ul");
    for (let key in datos) {
        let clave = key.replace("_", " ");
        let valor = datos[key] != "" ? datos[key] : "???";
        let color = datos[key] != "" ? "unset" : "red";
        let li = document.createElement("li");
        li.style.textTransform = "capitalize";
        li.innerHTML = `<b style="color:${color}">${clave}</b>: ${valor}`
        ul.appendChild(li);
    }
    contenedor.appendChild(ul);

    // Validar que los datos de registro esten completos y no existan campos vacios
    let keys = Object.keys(datos);
    if (keys.length < 16) {
        $("#datos-incompletos-modal").modal("show");
    } else {
        let display = "inline";

        // Validar campos vacios
        for (let dat in datos) {
            if (datos[dat] == "") {
                $("#datos-incompletos-modal").modal("show");
                display = "none"
            }
        }

        // Mostrar boton para finalizar el registro
        document.getElementById("finalizar-btn").style.display = display;
    }
}

export function mostrarOcultarPantallas(act, next) {
    document.querySelector(`div[data-paso='${act}']`).style.visibility = "hidden";
    document.querySelector(`div[data-paso='${next}']`).style.visibility = "visible";
    document.querySelector(`div[data-screen='${act}']`).style.display = "none";
    document.querySelector(`div[data-screen='${next}']`).style.display = "block";
}

export function crearCookie(user = "", pass = "", days) {
    let exp = new Date(Date.now() + (86400000 * days)).toUTCString(); // Expirar en un mes
    document.cookie = `user&Pass=${user}/${pass};expires=${exp};path=/`;
    document.cookie = `site=agendaRhelen;expires=${exp};path=/`;
}

