// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "hardhat/console.sol";


contract NFT is ERC721 {
    uint public tokenID;
    mapping(address => tokenMetaData[]) public ownershipRecord;

    struct tokenMetaData {
        uint tokenID;
        uint timestamp;
        string tokenURI;
    }

    function mintToken(address _recipient, string memory _url) public {
        _safeMint(_recipient, tokenID);
        ownershipRecord[_recipient].push(tokenMetaData(tokenID, block.timestamp, _url));
        tokenID = tokenID + 1;
    }

    function withdraw(address _to, uint _tokenID) {
        safeTransferFrom(msg.sender, _to, _tokenID);
        removePreviousNft(_tokenID);
    }

    function removePreviousNft(uint _tokenID) {
        uint length = ownershipRecord[msg.sender].length;
        for(uint i = 0; i < length; i++) {
            if(ownershipRecord[msg.sender][i].tokenID == _tokenID) {
                for(uint j = i + 1; j < length - 1; j++) {
                    ownershipRecord[msg.sender][i] = ownershipRecord[msg.sender][j];
                }
                break;
            }
        }
        ownershipRecord[msg.sender].pop();
    }
}
