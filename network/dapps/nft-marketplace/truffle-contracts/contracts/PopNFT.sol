// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721.sol";

contract PopNFT is ERC721{
    constructor() ERC721("POP", "POP") {}

    struct PopDetail{
        string firstName;
        string lastName;
        string organisation;
    }

    mapping(uint256 => PopDetail) PopDetails;
    uint256 public registeredPopCount = 0;

    event PopNFTEvent( uint256 nftID, uint256 recordedTime);

    function createPopNFT(string memory firstName,
        string memory lastName,
        string memory organisation) public {
            PopDetails[registeredPopCount]=PopDetail(firstName,lastName,organisation);
            _mint(msg.sender, registeredPopCount);
            registeredPopCount += 1;
            uint256 recordedTime=block.timestamp;
            emit PopNFTEvent(registeredPopCount-1,recordedTime);


    }
    function getPopDetails(uint256 popId)
        public
        view
        returns (PopDetail memory)
    {
        return PopDetails[popId];
    }

    
}