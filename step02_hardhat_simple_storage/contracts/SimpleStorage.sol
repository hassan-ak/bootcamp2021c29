// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract SimpleStorage {
    uint256 data;

    function updateData(uint256 _data) public {
        console.log("Updating Data: ", _data);
        data = _data;
    }

    function readData() public view returns (uint256) {
        console.log("Reading Data: ", data);
        return data;
    }
}
