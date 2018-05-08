pragma solidity 0.4.23;


// @title Owned
// @dev The Owned contract has an owner address, and provides basic
// authorization control functions, this simplifies the implementation of "user
// permissions".
contract Owned {
    address public owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    // @dev The Owned constructor sets the original `owner` of the contract to
    // the sender account.
    constructor() internal {
        owner = msg.sender; // solhint-disable-line
    }

    // @dev Throws if called by any account other than the owner.
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    // @dev Allows the current owner to transfer control of the contract to a
    // newOwner.
    // @param newOwner The address to transfer ownership to.
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0));
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }
}
