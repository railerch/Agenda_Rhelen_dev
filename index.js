const EXPRESS = require("express");
const APP = EXPRESS();
const PATH = require("path");
const REGISTROS = require("./routes/registros-rt");

// CONFIG
APP.set("port", 8000);
APP.set("view engine", "ejs");
APP.set("views", PATH.join(__dirname, "views"));

// MIDDLEWARE
APP.use("/jquery", EXPRESS.static(PATH.join(__dirname, "node_modules/jquery/dist")));
APP.use("/bs/css", EXPRESS.static(PATH.join(__dirname, "node_modules/bootstrap/dist/css")));
APP.use("/bs/js", EXPRESS.static(PATH.join(__dirname, "node_modules/bootstrap/dist/js")));
APP.use("/bs-i/css", EXPRESS.static(PATH.join(__dirname, "node_modules/bootstrap-icons/font")));
APP.use(EXPRESS.static(PATH.join(__dirname, "public")));
APP.use(EXPRESS.urlencoded({ extended: false }));

// ROUTES
APP.use("/", REGISTROS);
APP.get("/server", (req, res) => {
    res.status(200);
    res.header("content-type", "text/html");
    res.render("serverPage", { port: 8000 })
})

// SERVER
APP.listen(APP.get("port"), () => {
    console.log("Server at: http://localhost:" + APP.get("port"));
})