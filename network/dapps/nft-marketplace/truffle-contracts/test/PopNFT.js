const PopNFT = artifacts.require("PopNFT");

/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */
var instance;
contract("PopNFT", function (accounts) {
  it("The contracts are deployed correctly", async function () {
    instance = await PopNFT.deployed();
    return assert.isNotNull(instance.address);
  });

  it("Create a new POP NFT", async function () {
    await instance.createPopNFT("Abhi", "Singh", "Pandya", {
      from: accounts[0],
    });
    const data = await instance.getPopDetails(0);
    assert.equal(data[0], "Abhi");
    assert.equal(data[1], "Singh");
    assert.equal(data[2], "Pandya");
  });
});
