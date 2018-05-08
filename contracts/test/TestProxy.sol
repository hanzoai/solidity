pragma solidity 0.4.23;

import "../Proxy.sol";


contract TestProxy is Proxy {
    function setDelegate(address _delegate) public {
        delegate = _delegate;
    }
}
