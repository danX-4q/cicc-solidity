pragma solidity ^0.4.24;

import "./OwnedContract.sol";

contract ContractCreator {

        OwnedContract con = new OwnedContract(10);

        function NewContract(uint accountId)
        {
                con = new OwnedContract(accountId);
        }

        function NewContractWithCoin(uint accountId, uint amount)
        {
                con = (new OwnedContract).value(amount)(accountId);
        }
}
