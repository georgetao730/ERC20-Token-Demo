module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*", // Match any network id
    },
    // You can add more networks here
  },

  compilers: {
    solc: {
      version: "0.8.29", // Specify the Solidity compiler version
    },
  },
};