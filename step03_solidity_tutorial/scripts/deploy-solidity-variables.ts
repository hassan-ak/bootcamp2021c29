import { ethers } from 'hardhat';

async function main() {
  const SolidityVariables = await ethers.getContractFactory(
    'SolidityVariables'
  );
  const solidityVariables = await SolidityVariables.deploy();

  await solidityVariables.deployed();

  console.log('SolidityVariables deployed to:', solidityVariables.address);

  const txt1 = await solidityVariables.getResultLocal();
  console.log('**********');
  console.log('SolidityVariables Result Local = ', txt1);
  console.log('SolidityVariables Result Local = ', txt1.toString());
  console.log('**********');
  const txt2 = await solidityVariables.getResultState();
  console.log('SolidityVariables Result State = ', txt2);
  console.log('SolidityVariables Result state = ', txt2.toString());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
