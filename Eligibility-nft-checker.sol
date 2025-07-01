// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IERC721 {
    function balanceOf(address owner) external view returns (uint256);
}

contract NFTEligibilityChecker {
    // Address of the NFT contract
    address public nftContract;

    // Owner of this contract (can update the NFT contract address)
    address public owner;

    // Modifier to restrict function access to contract owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }

    constructor(address _nftContract) {
        owner = msg.sender;
        nftContract = _nftContract;
    }

    // Allows the owner to update the NFT contract address
    function setNFTContract(address _nftContract) external onlyOwner {
        nftContract = _nftContract;
    }

    // Check if a user is eligible (owns at least 1 NFT)
    function isEligible(address user) external view returns (bool) {
        return IERC721(nftContract).balanceOf(user) > 0;
    }
}
