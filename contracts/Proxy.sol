pragma solidity 0.4.23;


contract Proxy {
    address public delegate;

    // solium-disable
    // solhint-disable
    function () payable public {
        // Require successfull delegate call

        require(delegate.delegatecall(msg.data));
        assembly {
            let outsize := returndatasize
            let outptr := mload(0x40) // Load memory
            mstore(0x40, add(outptr, outsize)) // Load up to return size
            returndatacopy(outptr, 0, outsize) // Copy last return into pointer
            return(outptr, outsize)
        }
    }
}
