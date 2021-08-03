# Advance-Solidity

Please play the youtube link or view the Screenshots folder to see the Transaction with Puppercoin: https://www.youtube.com/watch?v=dgJYSdsOtLU


-Objective: The company has decided to crowdsale their PupperCoin token in order to help fund the network development

This network will be used to track the dog breeding activity across the globe in a decentralized way, and allow humans to track the genetic trail of their pets. The company has already worked with the necessary legal bodies and have the green light on creating a crowdsale open to the public. However, you are required to enable refunds if the crowdsale is successful and the goal is met, and you are only allowed to raise a maximum of 300 Ether. The crowdsale will run for 24 weeks.

### Using Remix, Ive Created a new contract named `PupperCoinCrowdsale.sol`, and prepared it like a standard crowdsale. Since this is a Test Environment, ive used parameters from previously used  standard `ERC20Mintable` and `ERC20Detailed` contract, hardcoding `18` as the `decimals` parameter, and leaving the `initial_supply` parameter alone ###

### The contract is bootsrapped by inheriting the following OpenZeppelin contracts:

* `Crowdsale`

* `MintedCrowdsale`

* `CappedCrowdsale`

* `TimedCrowdsale`

* `RefundablePostDeliveryCrowdsale`


### This contract CrowdSale allows parties involved to send ETH and get PupperCoin. This contract will facilitate the transaction automatically and mint tokens distributing them to buyers .

### The video illustrates the cap set at 6 ETH as well as having the closingTime set at now + 5 minutes in order to showcase the traanaction time and its usage. There are 3 addresses sending 2 ETH to the contract to reach the goal of 6 ETH.

https://www.youtube.com/watch?v=dgJYSdsOtLU

- View this repo to see the solidity files: PupperCoin and PupperCoinCrowdSale. 
