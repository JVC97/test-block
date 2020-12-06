pragma solidity >=0.4.24;

contract UserContract {
    struct User{
        string email;
        string carrera;
        string telefono;
        string estado;
        string mac;
    }
    struct Estado{
        string estado;
        string fecha;
    }

    mapping(address => User) private users;
    mapping(address => bool) private joinedUsers;
    mapping(address => Estado[]) private estados;
    address[] total;

    function join(string email, string carrera, string telefono, string estado, string mac) public{
        require(!userJoined(msg.sender));
        User storage user = users[msg.sender];
        user.email=email;
        user.carrera=carrera;
        user.telefono=telefono;
        user.estado=estado;
        user.mac=mac;

        joinedUsers[msg.sender]= true;
        total.push(msg.sender);

    }
    function update(string email, string carrera, string telefono, string estado, string mac) public{
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

    function getUser(address addr) public view returns (string,string,string,string,string){
        require(userJoined(msg.sender));
        User memory user = users[addr];
        return(user.email, user.telefono, user.carrera, user.estado, user.mac);

    }

    function userJoined(address addr) private view returns(bool){
        return joinedUsers[addr];
    }
    function totalUsers() public view returns (uint){
        return total.length;
    }
}
