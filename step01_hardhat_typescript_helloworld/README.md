# Step01 - Hardhat typescript helloworld

## Steps to code (Method 03)

1. Create new directory using `mkdir step01_hardhat_typescript_helloworld`
2. Navigate to the newly created directory using `cd step01_hardhat_typescript_helloworld`
3. Initiate a npm package using `npm init --yes`
4. Install hardhat using `npm install --save-dev hardhat`
5. Create a advance hardhat typescript project using `npx hardhat`
6. Install required dependancies using `npm install --save-dev "hardhat@^2.8.2" "@nomiclabs/hardhat-waffle@^2.0.0" "ethereum-waffle@^3.0.0" "chai@^4.2.0" "@nomiclabs/hardhat-ethers@^2.0.0" "ethers@^5.0.0" "@nomiclabs/hardhat-etherscan@^2.1.3" "dotenv@^10.0.0" "eslint@^7.29.0" "eslint-config-prettier@^8.3.0" "eslint-config-standard@^16.0.3" "eslint-plugin-import@^2.23.4" "eslint-plugin-node@^11.1.0" "eslint-plugin-prettier@^3.4.0" "eslint-plugin-promise@^5.1.0" "hardhat-gas-reporter@^1.0.4" "prettier@^2.3.2" "prettier-plugin-solidity@^1.0.0-beta.13" "solhint@^3.3.6" "solidity-coverage@^0.7.16" "@typechain/ethers-v5@^7.0.1" "@typechain/hardhat@^2.3.0" "@typescript-eslint/eslint-plugin@^4.29.1" "@typescript-eslint/parser@^4.29.1" "@types/chai@^4.2.21" "@types/node@^12.0.0" "@types/mocha@^9.0.0" "ts-node@^10.1.0" "typechain@^5.1.2" "typescript@^4.5.2"`
7. Complie the app using `npx hardhat compile` it will compile the solidity code and genrate its byte code in abi.
8. Test the app using `npx hardhat test`
9. Deploy the app using `npx hardhat run scripts/deploy.ts` this will deploy the app to temp local blockchain which can't be accessed just deployment success message will be recieved.
10. Use `npx hardhat node` to create a local blockchain and it will list multiple coounts
11. Use `npx hardhat run scripts/deploy.ts --network localhost` to deploy on the blockchain created by above step.
12. Update "hardhat.config.ts" to remove following part from the code

    ```ts
    gasReporter: {
        enabled: process.env.REPORT_GAS !== undefined,
        currency: "USD",
    },
    etherscan: {
        apiKey: process.env.ETHERSCAN_API_KEY,
    },
    ```

13. Signup to [alchemy](https://dashboard.alchemyapi.io/) and create an app in development environment on ethereum chain and ropsten network. From the keys copy HTTP link which is to be used in next step. From metamask walet get your private key too.

14. Create ".env" file with following content

    ```
    ROPSTEN_URL=https://eth-ropsten.alchemyapi.io/v2/<YOUR ALCHEMY KEY>
    PRIVATE_KEY=0xabc123abc123abc123abc123abc123abc123abc123abc123abc123abc123abc1
    ```

15. Use `npx hardhat run scripts/deploy.ts --network ropsten` to deploy on ropsten network. After deployment it can also be verified from the etherscan using the deployed address.

16. Create "scripts/set-greetings-one.ts" to deploy the contract and execute a function after deployemnt. This can be tested on local network or on the ropsten network.

    ```js
    import { ethers } from 'hardhat';

    async function main() {
      const Greeter = await ethers.getContractFactory('Greeter');
      const greeter = await Greeter.deploy('Hello, Hardhat!');

      await greeter.deployed();

      console.log('Greeter deployed to:', greeter.address);

      const result = await greeter.greet();
      console.log('Result = ', result);
    }

    main().catch((error) => {
      console.error(error);
      process.exitCode = 1;
    });
    ```

17. Create "scripts/set-greetings-two.ts" to use the deployed contract to perform some function.

    ```js
    import { ethers } from 'hardhat';

    async function main() {
      const Greeter = await ethers.getContractFactory('Greeter');
      const greeter = await Greeter.attach(
        '0x0f3bAAB7ea7C7532be73E4a500c527bab696918D'
      );

      console.log('Greeter Address:', greeter.address);

      const txt = await greeter.setGreeting('New Greetings 2nd Transaction');
      console.log('Transaction Details = ', txt);

      const rec = await txt.wait();
      console.log('Rec = ', rec);
    }

    main().catch((error) => {
      console.error(error);
      process.exitCode = 1;
    });
    ```
