pragma solidity ^0.4.24;

contract OwnedContract {

    ContractCreator creator;
    address owner;
    bytes32 name;
    
    function OwnedContract(bytes32 _name){
        owner = msg.sender;

        creator = ContractCreator(msg.sender);
        name = _name;
    }

    function changeName(bytes32 newName){
        //if (msg.sender == creator) 
        {
            name = newName;
        }
    }

    function transfer(address newOwner){
        if (msg.sender != owner) return;

        if (creator.isContractTransferOK(owner, newOwner))
            owner = newOwner;
    }
}

contract ContractCreator {
    
    function createContract(bytes32 name)
       returns (OwnedContract contractAddress)
    {
        // 创立一个新的合约，并且返回它的地址
        // 返回的地址类型是"address"
        // 这个是和ABI最接近的类型
        return new OwnedContract(name);
    }

    function changeName(OwnedContract contractAddress, bytes32 name) {
        // "contractAddress" 的外部类型也是"address".
        contractAddress.changeName(name);
    }
}
