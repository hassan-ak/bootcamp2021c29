import { ethers } from 'hardhat';
import { FirstApplication, FirstApplication__factory } from '../typechain';

async function main() {
  const FirstApplication = await ethers.getContractFactory('FirstApplication');
  const firstApplication = await FirstApplication.deploy();

  await firstApplication.deployed();

  console.log('FirstApplication deployed to:', firstApplication.address);

  const txt1 = await firstApplication.getResult();
  console.log('FirstApplication Result = ', txt1);
  console.log('FirstApplication Result = ', txt1.toString());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
