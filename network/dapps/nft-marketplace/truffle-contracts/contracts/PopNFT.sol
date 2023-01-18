// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721.sol";

contract PopNFT is ERC721 {
    constructor() ERC721("POP", "POP") {}

    struct PopDetail {
        string firstName;
        string lastName;
    }

    mapping(uint256 => PopDetail) PopDetails;

    event PopNFTEvent(uint256 nftId, uint256 recordedTime);

    function createPopNFT(
        string memory firstName,
        string memory lastName,
        uint256 nftId
    ) public {
        PopDetails[nftId] = PopDetail(firstName, lastName);
        _mint(msg.sender, nftId);
        uint256 recordedTime = block.timestamp;
        emit PopNFTEvent(nftId, recordedTime);
    }

    function getPopDetails(
        uint256 popId
    ) public view returns (PopDetail memory) {
        return PopDetails[popId];
    }
}
