import "@nomicfoundation/hardhat-toolbox";
import "@nomiclabs/hardhat-etherscab";
import "dotenv";
import { HardhatUserConfig } from "hardhat/config";

const config: HardhatUserConfig = {
  solidity: "0.8.20",
  networks: {
    goerli: {
      url: process.env.ALCHEMY_ENDPOINT,
    },
  },
};

export default config;
