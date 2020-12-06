class UserServices {
    constructor(contract){
        this.contract=contract;
    }

    async getUsers(){
        let total = await this.getTotalUser();
        let users = [];
        for(var i=0;i < total;i++){
            let user = await this.contract.total(i);
            users.push(user);
        }
        return this.mapUsers(users);
    }

    async getTotalUser(){
        return await this.contract.totalUsers().toNumber();
    }

    mapUsers(users){
        return users.map(user =>{
            return{
                email: user[0],
                carrera: user[1],
                telefono:user[2],
                estado:user[3],
                mac:user[4]
            }
        })
    }
}

module.exports = UserServices;