// SPDX-License-Identifier: MIT
pragma solidity ^0.8.29;

// Interface for the ERC20 standard token
interface IERC20 {
    // Returns the total supply of the token 
    // 代币总量
    function totalSupply() external view returns (uint256);

    // Returns the balance of the account 
    // 地址上的余额
    function balanceOf(address account) external view returns (uint256);

    // Transfers the amount of tokens from the sender to the to address 
    // 向 to 发送 amount 个代币
    function transfer(address to, uint256 amount) external returns (bool);

    // Returns the remaining amount of tokens that spender is allowed to spend on behalf of the owner 
    // 查询 owner 给 spender 的额度(总配额)
    function allowance(address owner, address spender) external view returns (uint256);

    // Approves the spender to spend the amount of tokens on behalf of the sender
    // 批准给 spender 的额度为 amount(当前配额)
    function approve(address spender, uint256 amount) external returns (bool);

    // Transfers the amount of tokens from the sender to the recipient on behalf of the owner
    // from 提取 to 给自己的额度
    function transferFrom(address from, address to, uint256 amount) external returns (bool);

    //  Events 转账
    // 代币转移事件：从 from 到 to 转移 value 个代币
    event Transfer(address indexed from, address indexed to, uint256 value);

    //  Events 授权
    // 额度批准事件：owner 给 spender 的额度为 value
    event Approval(address indexed owner, address indexed spender, uint256 value);
}