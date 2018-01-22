pragma solidity ^0.4.0;

Alice has 1 LTC that she wants to trade for 1 ETH.
First, Alice sends her private key containing the 1 LTC to the Galileo smart contract/DAO. 
// (As long as there's some privacy preserving way to send this over an unreliable communication network, the privKey will only be known by the DAO, which will hide the details.)
// Will probably need to use Nucypher or something to be able to trade on this.
// Galileo, described
// Methods:
receive(string ticker, string privKey, string ethUserAddress): Receives assets of any supported blockchain. Calls create()
mint(string ticker, string ethUserAddress): //Creates an IOU, that can be traded like a collateralized derivative, and is ERC20 based. Transfers ownership of ERC20 token to ethUserAddress. (use dYdX here?)
verify(string ticker, string privKey): Verify with said chain (either via Polkadot or Cosmos, or with a decentralized oracle) that funds exist. If it does, call transfer(). If this is a secondary verification, call accept().
transfer(string ticker, string privKey): Now that we know funds exist, generate pub-privkey pair and transfer coins from privKey to newly generated key. Calls verify() again to make sure money moved.

Using the above method, Alice trades her LTC to to the DAO and is given an ERC20-compatible collateralized asset, which she can then go trade for other assets. The idea is that the numebr of interesting non-ETH that will be traded will have sufficient liquidity.

unbond(string ticker, string crossChainPubKey, uint256 amount): Called when a user wants to get access the LTC(or whatever cross blockchain asset they want). Function calls burn() as a subroutine to maintain the one-to-one balance of ERC20 IOU and tx balance of asset.
// Needs to call verify() to make sure that funds have actually been sent

burn(unit256 amount): Sends to address 0x00000000000000 to verifiably get rid of token.
//

Say that Bob, who now owns the LTC ERC20 asset, after he traded it with Alice for $OMG, wants to cash out of the system. He simply calls that method on the DAO, and receives back a private key for that amount of Litecoin. The DAO can also automatically rebalance the amount of Litecoin a user may want out of the system (which means these orders are splittable), by combining and splitting LTC as a user may want.
