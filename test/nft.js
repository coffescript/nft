const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("NFT", function () {
  it("Should mint a new item", async function () {
    const NFT = await ethers.getContractFactory("NFT");
    const nft = await NFT.deploy();
    await nft.deployed();


    const tx = await nft.awardItem('0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266', "https://game.example/item-id-8u5h2m.json")

    console.log('tx: ', tx);

    const owner = await nft.ownerOf(1);
    const tokenURI = await nft.tokenURI(1);

    console.log('owner', tokenURI);

    //expect(await nft.greet()).to.equal("Hello, world!");

  });
});
