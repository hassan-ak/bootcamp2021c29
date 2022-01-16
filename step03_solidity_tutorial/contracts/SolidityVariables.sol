//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract SolidityVariables {
    // *********************** //
    // ****** Variables ****** //
    // *********************** //
    /*
        State Variables − Variables whose values are permanently stored in a contract storage.
        Local Variables − Variables whose values are present till function is executing.
        Global Variables − Special variables exists in the global namespace used to get information about the blockchain.
    */

    uint256 storedData; // State variable

    constructor() public {
        storedData = 10;
    }

    function getResultLocal() public pure returns (uint256) {
        uint256 a = 1; // local variable
        uint256 b = 2;
        uint256 result = a + b;
        return result; //access the local variable
    }

    function getResultState() public view returns (uint256) {
        return storedData; //access the Global variable
    }
}
