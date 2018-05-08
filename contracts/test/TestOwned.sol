pragma solidity 0.4.23;

import "../Owned.sol";


contract TestOwned is Owned {
    function ownedFunc() public view onlyOwner returns (bool) {
        return true;
    }

    function publicFunc() public pure returns (bool) {
        return true;
    }
}
