// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721.sol";

contract LearningNFT is ERC721{
    constructor() ERC721("Learn", "LRN") {}

    struct BadgeDetail{
        uint256 contentId;
        uint256 startedTimestamp;
        uint256 endTimestamp;
    }

    mapping(uint256 => BadgeDetail) BadgeDetails;
    uint256 public registeredBadgeCount = 0;

    event createLearningNFTEvent( uint256 nftID, uint256 startedTimestamp, uint256 endTimestamp,uint256 recordedTimestamp);

    function createLearningNFT(uint256 contentId,
        uint256 startedTimestamp,
        uint256 endTimestamp) public {
            BadgeDetails[registeredBadgeCount]=BadgeDetail(contentId,startedTimestamp,endTimestamp);
            _mint(msg.sender, registeredBadgeCount);
            registeredBadgeCount += 1;
            uint256 recordedTime=block.timestamp;
            emit createLearningNFTEvent(registeredBadgeCount-1,startedTimestamp,endTimestamp,recordedTime);


    }
    function getBadgeDetails(uint256 badgeId)
        public
        view
        returns (BadgeDetail memory)
    {
        return BadgeDetails[badgeId];
    }

    
}