const ERC20 = artifacts.require("ERC20");

module.exports = function (deployer) {
  const name = "GeorgeoTao Token";
  const symbol = "GTT";
  const totalSupply = 1000000; // 代币总供应量

  deployer.deploy(ERC20, name, symbol, totalSupply);
};