const GTT = artifacts.require("GTT");

module.exports = function (deployer) {
  const name = "GeorgeTaoToken";
  const symbol = "GTT";
  const totalSupply = 1000000; // 代币总供应量

  deployer.deploy(GTT, name, symbol, totalSupply);
};