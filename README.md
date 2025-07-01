This smart contract verifies whether a given address is "eligible" based on its ownership of NFTs from a specific ERC-721 contract.We can use it for token airdrop in monad testner for nft holders
how it works? 
- Takes the address of an existing NFT (ERC-721) contract.
- Uses the `balanceOf(address)` method to check if the user owns at least one token.
- If the user owns 1 or more NFTs, they are considered eligible.
===========================================================================================
Features
- `isEligible(address)` — returns `true` if the user holds any NFTs.
- `setNFT(address)` — allows the contract owner to change the NFT contract being checked.
- Owner-restricted control using `onlyOwner` modifier.

Example:
const contract = await NFTEligibilityChecker.deploy("0xYourNFTContractAddress");    