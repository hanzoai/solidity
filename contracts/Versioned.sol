pragma solidity 0.4.23;

import "./Owned.sol";
import "./Proxy.sol";


interface Version {
    function version() external pure returns (string);

}


contract Versioned is Owned, Proxy {
    event Upgrade(string version, address indexed predecessor, address indexed successor);

    // Update current version and store method configurations
    function setVersion(Version successor) public onlyOwner {
        address predecessor = delegate;
        delegate = address(successor);
        emit Upgrade(successor.version(), predecessor, successor);
    }
}
