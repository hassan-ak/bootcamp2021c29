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
