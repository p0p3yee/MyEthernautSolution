pragma solidity ^0.6.0;

interface Token{
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address to, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);
}

contract Crack {
    Token target;

    constructor(address _target) public {
        target = Token(_target);
    }

    function crack() external {
        require(target.allowance(msg.sender, address(this)) >= target.balanceOf(msg.sender), "Approve first");
        target.transferFrom(msg.sender, address(this), target.balanceOf(msg.sender));
    }

}