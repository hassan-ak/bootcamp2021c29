import { ethers } from 'hardhat';

async function main() {
  const SolidityVariablesGlobal = await ethers.getContractFactory(
    'SolidityVariablesGlobal'
  );
  const solidityVariablesGlobal = await SolidityVariablesGlobal.deploy();

  await solidityVariablesGlobal.deployed();

  console.log(
    'SolidityVariablesGlobal deployed to:',
    solidityVariablesGlobal.address
  );

  const txt1 = await solidityVariablesGlobal.getResult();
  console.log('SolidityVariablesGlobal Result = ', txt1);
  console.log('SolidityVariablesGlobal Result = ', txt1.toString());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
