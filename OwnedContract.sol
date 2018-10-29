pragma solidity ^0.4.24;

import "./ContractCreator.sol";

contract OwnedContract {
    uint accId;
    ContractCreator creator;
    address owner;

    function OwnedContract(uint accoutId)payable{
        owner = msg.sender;
        accId = accoutId;
        creator = ContractCreator(msg.sender);
    }
}
