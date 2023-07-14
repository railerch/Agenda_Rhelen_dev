// MODULO DE FUNCIONES

export function preloader(load = true) {
    let preloaderDiv = document.getElementById("preloader-div");

    if (load) {
        preloaderDiv.innerHTML = "<div class='d-flex justify-content-center align-itens-center' style='height: 200px;'><img class='align-self-center' src='img/preloader.gif' alt='preloader img'></div>";
    } else {
        preloaderDiv.innerHTML = "";
    }
}

export function datos_de_registro() {
    // Verificar que el usuario haya introducido datos

    let contenedor = document.getElementById("datos-para-confirmar");
    if (sessionStorage.getItem("datosRegistro")) {
        contenedor.innerHTML = ""
        let datos = JSON.parse(sessionStorage.getItem("datosRegistro"));

        // Lista de datos para verificar
        let ul = document.createElement("ul");

        for (let key in datos) {
            let clave = key.replace("_", " ");
            let valor = datos[key];
            let li = document.createElement("li");
            li.style.textTransform = "capitalize";

            li.innerHTML = `<b>${clave}</b>: ${valor}`
            ul.appendChild(li);
        }

        contenedor.appendChild(ul);

        // Validar que los datos de registro esten completos
        let keys = Object.keys(datos);

        if (keys.length < 11) {
            $("#datos-incompletos-modal").modal("show");
        } else {
            let display = "inline";

            // Validar que no existan campos en blanco
            for (let dat in datos) {
                if (datos[dat] == "") {
                    $("#datos-incompletos-modal").modal("show");
                    display = "none"
                }
            }

            document.getElementById("finalizar-btn").style.display = display;
        }
    } else {
        contenedor.innerHTML = "<h3 class='text-danger'>Sin datos que mostrar.</h3>"
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

