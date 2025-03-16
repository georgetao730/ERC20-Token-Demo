const GTT = artifacts.require("GTT");

module.exports = function (deployer) {
  const name = "GeorgeTaoToken";
  const symbol = "GTT";
  const totalSupply = 10000;

  deployer.deploy(GTT, name, symbol, totalSupply);
};