pragma solidity >=0.4.24;

contract UserContract {
    
    struct Estado{
        string estado;
        string fecha;
        string razon;
    }
    address public owner;

    struct User{
        string email;
        string carrera;
        string telefono;
        string estado;
        string mac;
        bool joined;
    }
    struct Contact{
        string correo;
        address contact;
    }

    mapping(address => User) private users;
    mapping(address => bool) private joinedUsers;
    mapping(address => Estado[]) private estados;
    mapping(address => Contact) private contactos;
    //Estado[] estados;

    function join(string email, string carrera, string telefono, string estado, string mac) public{
        require(!userJoined(msg.sender));
        User storage user = users[msg.sender];
        user.email= email;
        user.carrera= carrera;
        user.telefono= telefono;
        
        user.mac= mac;
        estados[msg.sender];
        User(email, carrera, telefono, estado, mac);
        joinedUsers[msg.sender]= true;
        total.push(msg.sender);

    }

    function update(string email, string carrera, string telefono, string  estado, string  mac) public{
        require(userJoined(msg.sender));
        User storage user = users[msg.sender];
        if(keccak256(email) != keccak256("")){
            user.email=email;
        }
        if(keccak256(email) != keccak256("")){
            user.carrera=carrera;
        }
        if(keccak256(email) != keccak256("")){
            user.telefono=telefono;
        }
        if(keccak256(email) != keccak256("")){
            user.estado=estado;
        }
        if(keccak256(email) != keccak256("")){
            user.mac=mac;
        }
    }

    function getUser(address addr) public view returns (string , string, string, string, string){
        require(userJoined(msg.sender));
        User memory user = users[addr];
        return(user.email, user.telefono, user.carrera, user.estado, user.mac);
    }

    function updateState(string memory updt, string memory date, string memory razon) public{
        address addr = msg.sender;
        require(userJoined(addr));
        Estado memory st=Estado({estado: updt,fecha: date, razon: razon});
        estados[addr].push(st);
        User memory user = users[addr];
        user.estado= st;
        if(updt != "libre"){
            /* if(updt =="contagiado"){
                for(users as u){
                    if(u.estado != "contagiado")
                        users[contactos[1].contact].estado = "riesgo";
                        updateState2(address, "riesgo", "fecha", "contacto");// mandar correos
                }
                return null;
            } */
            //aux = contact(contactos);
            return contactos;
        }
    }
    function userJoined(address addr) private view returns(bool){
        return joinedUsers[addr];
    }
    function contacts(address contact){
        //holi
    }
    function totalUsers() public view returns (uint){
        return total.length;
    }
}
