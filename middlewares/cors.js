const cors = (req, res, next) => {
    res.header("Access-Control-Allow-Origin", "http://arnica.dnsalias.com:8000");
    next();
}

module.exports = cors;