pragma solidity 0.4.24;

import "zeppelin-solidity/contracts/ownership/Ownable.sol";


contract Whitelist is Ownable {
    mapping (address => bool) whitelist;

    event AddedToWhitelist(address indexed addr);
    event RemovedFromWhitelist(address indexed addr);

    constructor() Ownable() public {}

    function addToWhitelist(address addr) public onlyOwner {
        whitelist[addr] = true;
        emit AddedToWhitelist(addr);
    }

    function removeFromWhitelist(address addr) public onlyOwner {
        whitelist[addr] = false;
        emit RemovedFromWhitelist(addr);
    }

    function isWhitelisted(address addr) public view returns (bool) {
        return whitelist[addr];
    }
}
