const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Greeter", function () {
  it("Greeter test", async function () {
    const Charity = await ethers.getContractFactory("Charity");
    const goodCharity = await Charity.deploy();
    await goodCharity.deployed();

    const Receiver = await ethers.getContractFactory("Receiver");
    const receiver = await Receiver.deploy();
    await receiver.deployed();

    const CharitySplitter = await ethers.getContractFactory("CharitySplitter");
    const charitySplitter = await CharitySplitter.deploy();
    await charitySplitter.deployed();

    await charitySplitter.donate(goodCharity.address, { value: 10 });
    await charitySplitter.donate(receiver.address, { value: 10 });

    console.log("Charity end: ", goodCharity.address, receiver.address, charitySplitter.address);

    await receiver.receive({ value: 10 });

    let provider = ethers.getDefaultProvider();
    let privateKey = "0xf78a036930ce63791ea6ea20072986d8c3f16a6811f6a2583b0787c45086f769"
    let wallet = new ethers.Wallet(privateKey, provider);
    let tx = {
      to: receiver.address,
      value: ethers.utils.parseEther('1.0')
    };

    await wallet.sendTransaction(tx);

    // console.log("Charity end: ", goodCharity.address, receiver.address, charitySplitter.address);

    // expect(await greeter.greet()).to.equal("Hola, mundo!");
  });
});
