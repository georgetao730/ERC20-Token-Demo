# ERC20 Token

## 简介

ERC20是以太坊上的一种合约标准，它包含5个函数、2个事件。具体如下：

- totalSupply()： token的总量
- balanceOf() ：某个地址上的余额
- transfer() ： 发送token
- allowance() ：额度、配额、津贴
- approve() ： 批准给某个地址一定数量的token(授予额度、授予津贴)
- transferFrom()： 提取approve授予的token(提取额度、提取津贴)
- Transfer() ： token转移事件
- Approval() ：额度批准事件

## 标准函数	含义
| 标准函数 | 含义 |
| --- | --- |
| totalSupply() | 代币总量 |
| balanceOf(address account) | account 地址上的余额 |
| transfer(address recipient, uint256 amount) | 向 recipient 发送 amount 个代币 |
| allowance(address owner, address spender) | 查询 owner 给 spender 的额度(总配额) |
| approve(address spender, uint256 amount) | 批准给 spender 的额度为 amount(当前配额) |
| transferFrom(address sender, address recipient, uint256 amount) | recipient 提取 sender 给自己的额度 |
| Transfer(address indexed from, address indexed to, uint256 value) | 代币转移事件：从 from 到 to 转移 value 个代币 |
| Approval(address indexed owner, address indexed spender, uint256 value) | 额度批准事件：owner 给 spender 的额度为 value |

