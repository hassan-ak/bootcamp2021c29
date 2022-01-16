//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract FirstApplication {
    constructor() {}

    // This is a comment. It is similar to comments in C++

    /*
     This is a multi-line comment in solidity
     It is very similar to comments in C Programming
    */

    function getResult() public pure returns (uint256) {
        uint256 a = 1;
        uint256 b = 2;
        uint256 result = a + b;
        return result;
    }
}
