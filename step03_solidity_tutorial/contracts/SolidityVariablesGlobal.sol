//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract SolidityVariablesGlobal {
    constructor() {}

    // *********************** //
    // *** Global Variable *** //
    // *********************** //
    /*
        // blockhash(uint blockNumber) returns (bytes32) --- Hash of the given block - only works for 256 most recent, excluding current, blocks
        // block.coinbase (address payable) --- Current block miner's address
        // block.difficulty (uint)	--- Current block difficulty
        // block.gaslimit (uint) --- Current block gaslimit
        // block.number (uint) ---	Current block number
        // block.timestamp (uint) --- Current block timestamp as seconds since unix epoch
        // gasleft() returns (uint256) --- Remaining gas
        // msg.data (bytes calldata) --- Complete calldata
        // msg.sender (address payable) --- Sender of the message (current caller)
        // msg.sig (bytes4) --- First four bytes of the calldata (function identifier)
        // msg.value (uint) --- Number of wei sent with the message
        // now (uint) --- Current block timestamp
        // tx.gasprice (uint) --- Gas price of the transaction
        // tx.origin (address payable) --- Sender of the transaction
    */

    function getResult() public view returns (uint256) {
        uint256 result = block.gaslimit;
        return result;
    }
}
