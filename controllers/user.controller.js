let _userService = null;
class UserController{
    constructor({UserService}){
        _userService=UserService;
    }

    async getAll(req,res){
        const users = await _userService.getUsers();
        return res.status(200).send(users);
    }
}

module.exports = UserController;