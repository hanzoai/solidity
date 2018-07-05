pragma solidity 0.4.24;

import "zeppelin-solidity/contracts/ownership/Ownable.sol";


contract Blacklist is Ownable {
    mapping (address => bool) blacklist;

    event AddedToBlacklist(address indexed addr);
    event RemovedFromBlacklist(address indexed addr);

    constructor() Ownable() public {}

    function addToBlacklist(address addr) public onlyOwner {
        blacklist[addr] = true;
        emit AddedToBlacklist(addr);
    }

    function removeFromBlacklist(address addr) public onlyOwner {
        blacklist[addr] = false;
        emit RemovedFromBlacklist(addr);
    }

    function isBlacklisted(address addr) public view returns (bool) {
        return blacklist[addr];
    }
}
