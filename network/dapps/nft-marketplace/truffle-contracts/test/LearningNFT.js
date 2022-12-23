const LearningNFT = artifacts.require("LearningNFT");

/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */
var instance;
contract("LearningNFT", function (accounts) {
  it("The contracts are deployed correctly", async function () {
    instance = await LearningNFT.deployed();
    return assert.isNotNull(instance.address);
  });

  it("Create a new Learning NFT", async function () {
    await instance.createLearningNFT(123, 333, 222, {
      from: accounts[0],
    });
    const data = await instance.getBadgeDetails(0);
    assert.equal(data[0], 123);
    assert.equal(data[1], 333);
    assert.equal(data[2], 222);
  });
});
