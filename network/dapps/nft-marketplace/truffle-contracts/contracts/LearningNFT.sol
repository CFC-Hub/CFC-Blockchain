// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721.sol";

contract LearningNFT is ERC721 {
    constructor() ERC721("Learn", "LRN") {}

    struct BadgeDetail {
        string firstName;
        string lastName;
        string contentId;
        uint256 submittedTimestamp;
    }

    mapping(uint256 => BadgeDetail) BadgeDetails;

    event createLearningNFTEvent(
        uint256 nftID,
        string firstName,
        string lastName,
        string contentId,
        uint256 submittedTimestamp,
        uint256 recordedTime
    );

    function createLearningNFT(
        uint256 nftID,
        string memory firstName,
        string memory lastName,
        string memory contentId,
        uint256 submittedTimestamp
    ) public {
        BadgeDetails[nftID] = BadgeDetail(
            firstName,
            lastName,
            contentId,
            submittedTimestamp
        );
        _mint(msg.sender, nftID);

        uint256 recordedTime = block.timestamp;
        emit createLearningNFTEvent(
            nftID,
            firstName,
            lastName,
            contentId,
            submittedTimestamp,
            recordedTime
        );
    }

    function getBadgeDetails(
        uint256 badgeId
    ) public view returns (BadgeDetail memory) {
        return BadgeDetails[badgeId];
    }
}
