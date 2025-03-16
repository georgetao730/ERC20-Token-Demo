// SPDX-License-Identifier: MIT
pragma solidity ^0.8.29;

import "./IERC20.sol";

// Interface for the ERC20 standard token
contract GTT is IERC20 {

    // 总量
    uint256 public override totalSupply;
    // 名称
    string public name;
    // 代号
    string public symbol;
    // 合约拥有者
    address public owner;

    // 精度
    uint public decimals = 18;
    // 余额
    mapping(address => uint256) public override balanceOf;
    // 额度 每个地址对其他地址的授权额度
    mapping(address => mapping(address => uint256)) public override allowance;

    constructor(string memory _name, string memory _symbol, uint256 _totalSupply) {
        name = _name;
        symbol = _symbol;
        totalSupply = _totalSupply * (10 ** decimals);
        owner = msg.sender;
        balanceOf[msg.sender] = _totalSupply;
    }

    // transfer函数允许代币持有者将一定数量的代币转移给另一个地址。
    // 它检查发送者的余额是否足够，然后更新余额并发出Transfer事件。
    function transfer(address recipient, uint amount) external override returns (bool) {
        require(balanceOf[msg.sender] >= amount, "ERROR: balance too low");
        balanceOf[msg.sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    // approve函数允许代币持有者授权另一个地址（spender）可以花费一定数量的代币。
    // 它更新授权额度并发出Approval事件。
    function approve(address spender, uint amount) external override returns (bool) {
        require(msg.sender != spender, "ERROR: cannot approve yourself");
        require(balanceOf[msg.sender] >= amount, "ERROR: not enough balance");
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    // transferFrom函数允许被授权的地址从另一个地址（sender）转移代币到接收者（recipient）。
    // 它检查发送者的余额和授权额度是否足够，然后更新余额和授权额度，并发出Transfer事件。
    function transferFrom(address sender, address recipient, uint amount) external override returns (bool) {
        require(balanceOf[sender] > amount, "ERROR: balance too low");
        require(allowance[sender][msg.sender] >= amount, "ERROR: allowance too low");
        allowance[sender][msg.sender] -= amount;
        balanceOf[sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(sender, recipient, amount);
        return true;
    }

    // mint函数允许合约拥有者铸造新的代币。
    // 它增加拥有者的余额和总供应量，并发出Transfer事件，表示从零地址（表示新代币）转移到拥有者地址
    function mint(uint256 amount) external {
        require(msg.sender == owner, "ERROR: only owner can mint");
        balanceOf[msg.sender] += amount;
        totalSupply += amount;
        emit Transfer(address(0), msg.sender, amount);
    }

    // burn函数允许合约拥有者销毁代币。
    // 它减少拥有者的余额和总供应量，并发出Transfer事件，表示从拥有者地址转移到零地址（表示销毁代币）。
    function burn(uint256 amount) external {
        require(msg.sender == owner, "ERROR: only owner can burn");
        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
        emit Transfer(msg.sender, address(0), amount);
    }

}