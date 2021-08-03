pragma solidity ^0.5.5;

import "./PupperCoin.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/CappedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/TimedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/distribution/RefundablePostDeliveryCrowdsale.sol";


contract PupperCoinSale is Crowdsale, MintedCrowdsale, CappedCrowdsale, TimedCrowdsale, RefundablePostDeliveryCrowdsale {

    constructor(uint rate, address payable wallet, PupperCoin token, uint256 cap, uint256 openingTime, uint256 closingTime, uint256 goal) 
        Crowdsale (rate, wallet, token)
        MintedCrowdsale()
        CappedCrowdsale(cap)
        TimedCrowdsale(openingTime, closingTime)
        RefundableCrowdsale(goal)
        public
    {
        // constructor can stay empty
    }
}

contract PupperCoinSaleDeployer {

    address public pupper_sale_address;
    address public pupper_address;

    constructor(string memory name, string memory symbol, address payable wallet) public 
    {
        PupperCoin token = new PupperCoin(name, symbol, 0);
        pupper_address = address(token);

        //Create the PupperCoinSale and tell it about the token.
        //Goal and cap are the same at 300 ether.
        PupperCoinSale pupper_sale = new PupperCoinSale(1, wallet, token, 300 ether, now, now + 24 weeks, 300 ether);

        pupper_sale_address = address(pupper_sale);

        // make the PupperCoinSale contract a minter, then have the PupperCoinSaleDeployer renounce its minter role
        token.addMinter(pupper_sale_address);
        token.renounceMinter();
    }
    
}