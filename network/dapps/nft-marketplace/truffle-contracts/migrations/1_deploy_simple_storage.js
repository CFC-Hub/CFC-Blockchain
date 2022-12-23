const PopNFT = artifacts.require("PopNFT");
const LearningNFT = artifacts.require("LearningNFT");

module.exports = function (deployer) {
  deployer.deploy(PopNFT);
  deployer.deploy(LearningNFT);
};
