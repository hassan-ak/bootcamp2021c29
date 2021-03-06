# Step02 - Simple Storage Hardhat Typescript Project

## Steps to code

1. Create new directory using `mkdir step02_hardhat_simple_storage`
2. Navigate to the newly created directory using `cd step02_hardhat_simple_storage`
3. Initiate a npm package using `npm init --yes`
4. Install hardhat using `npm install --save-dev hardhat`
5. Create a advance hardhat typescript project using `npx hardhat`
6. Install required dependancies using `npm install --save-dev "hardhat@^2.8.2" "@nomiclabs/hardhat-waffle@^2.0.0" "ethereum-waffle@^3.0.0" "chai@^4.2.0" "@nomiclabs/hardhat-ethers@^2.0.0" "ethers@^5.0.0" "@nomiclabs/hardhat-etherscan@^2.1.3" "dotenv@^10.0.0" "eslint@^7.29.0" "eslint-config-prettier@^8.3.0" "eslint-config-standard@^16.0.3" "eslint-plugin-import@^2.23.4" "eslint-plugin-node@^11.1.0" "eslint-plugin-prettier@^3.4.0" "eslint-plugin-promise@^5.1.0" "hardhat-gas-reporter@^1.0.4" "prettier@^2.3.2" "prettier-plugin-solidity@^1.0.0-beta.13" "solhint@^3.3.6" "solidity-coverage@^0.7.16" "@typechain/ethers-v5@^7.0.1" "@typechain/hardhat@^2.3.0" "@typescript-eslint/eslint-plugin@^4.29.1" "@typescript-eslint/parser@^4.29.1" "@types/chai@^4.2.21" "@types/node@^12.0.0" "@types/mocha@^9.0.0" "ts-node@^10.1.0" "typechain@^5.1.2" "typescript@^4.5.2"`
7. Create "contracts/SimpleStorage.sol" to defien a contract for simple storage

   ```js
   // SPDX-License-Identifier: MIT
   pragma solidity ^0.8.4;
   import 'hardhat/console.sol';
   contract SimpleStorage {
    uint256 data;
    function updateData(uint256 _data) public {
        console.log('Updating Data: ', _data);
        data = _data;
    }
    function readData() public view returns (uint256) {
        console.log('Reading Data: ', data);
        return data;
    }
   }
   ```

8. Complie the app using `npx hardhat compile` it will compile the solidity code and genrate its byte code in abi.
9. Update "test/index.ts"

   ```ts
   import { ethers } from 'hardhat';
   import { expect } from 'chai';
   describe('SimpleStorage', function () {
     it("Should return the new data once it's changed", async function () {
       const Storage = await ethers.getContractFactory('SimpleStorage');
       const storage = await Storage.deploy();
       await storage.deployed();
       const setUpdateTx = await storage.updateData(10);
       // wait until the transaction is mined
       await setUpdateTx.wait();
       expect(await storage.readData()).to.equal(10);
     });
   });
   ```

10. Test the app using `npx hardhat test`
