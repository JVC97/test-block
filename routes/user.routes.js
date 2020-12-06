const {Router} = require("express");

module.exports = function({UserController}){
    const router = Router();

    router.get("/getALL", UserController.getAll());
}