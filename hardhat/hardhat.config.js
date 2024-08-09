require("@nomicfoundation/hardhat-toolbox");

const { vars } = require("hardhat/config");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.24",
  networks: {
    devnet: {
      url: "http://localhost:8545",
    },
    testnet: {
      url: "http://localhost:8546",
    }
  }
};
