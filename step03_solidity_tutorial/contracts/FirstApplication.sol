//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract FirstApplication {
    constructor() {}

    // ********************** //
    // ****** Comments ****** //
    // ********************** //
    // This is a comment. It is similar to comments in C++
    /*
     This is a multi-line comment in solidity
     It is very similar to comments in C Programming
    */

    // ********************** //
    // ******** Types ********//
    // ********************** //
    /*
        Boolean --- bool --- true/false
        Integer	--- int/uint --- Signed and unsigned integers of varying sizes.
        Integer	--- int8 to int256 --- Signed int from 8 bits to 256 bits. int256 is the same as int.
        Integer	--- uint8 to uint256 --- Unsigned int from 8 bits to 256 bits. uint256 is the same as uint.
        Fixed Point Numbers	--- fixed/unfixed --- Signed and unsigned fixed point numbers of varying sizes.
        Fixed Point Numbers	--- fixed/unfixed --- Signed and unsigned fixed point numbers of varying sizes.
        Fixed Point Numbers ---	fixedMxN --- Signed fixed point number where M represents number of bits taken by type and N represents the decimal points. M should be divisible by 8 and goes from 8 to 256. N can be from 0 to 80. fixed is same as fixed128x18.
        Fixed Point Numbers	--- ufixedMxN --- Unsigned fixed point number where M represents number of bits taken by type and N represents the decimal points. M should be divisible by 8 and goes from 8 to 256. N can be from 0 to 80. ufixed is same as ufixed128x18.
    */

    function getResult() public pure returns (uint256) {
        uint256 a = 1;
        uint256 b = 2;
        uint256 result = a + b;
        return result;
    }
}
