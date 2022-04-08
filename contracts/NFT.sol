// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

/**
 * The ERC721URIStorage contract is a Interface of a ERC721, that includes the metadata
 * standard extensions (IERC721Metadata) as well as a mechanis for per-token metadata
 * where the _setTokenURI method comes from: we use it to store an item's metadata.
 * https://docs.openzeppelin.com/contracts/4.x/api/token/erc721#ERC721URIStorage
 */
contract NFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    string public _name;
    string public _symbol;
    string public tokenUri;

    //Declare an Event
    event Minted(address indexed player, uint256 itemId, string tokenURI);

    constructor() ERC721("GameItem", "ITM") { //string memory name, string memory symbol
        // console.log("Deploying a Amazing NFT:", symbol);
        // name = _name;
        // symbol = _symbol;
    }

    /**
     * @dev function for mint items, later you can implmenet 
     * the library Access Control for restrict what accounts can be it
     * https://docs.openzeppelin.com/contracts/4.x/access-control
     */
    function awardItem(address player, string memory tokenURI)
        public
        returns (uint256)
    {
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        _mint(player, newItemId);
        _setTokenURI(newItemId, tokenURI);
        tokenUri = tokenURI;
        emit Minted(player, newItemId, tokenURI);
        return newItemId;
    }
}

//https://bafybeihpjhkeuiq3k6nqa3fkgeigeri7iebtrsuyuey5y6vy36n345xmbi.ipfs.dweb.link/5346
