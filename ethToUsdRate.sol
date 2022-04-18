// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

//we can use import or interface
 //import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract EthToUsdRate {
  AggregatorV3Interface internal priceFeed;

  //get mainnet addresses from https://docs.chain.link/docs/bnb-chain-addresses/

  constructor() {
    // example for bsctestnet
    // ETH / USD
    priceFeed = AggregatorV3Interface(0x143db3CEEfbdfe5631aDD3E50f7614B6ba708BA7);
  }

  function getLatestPrice() public view returns (int) {
    (
      uint80 roundID,
      int price,
      uint startedAt,
      uint timeStamp,
      uint80 answeredInRound
    ) = priceFeed.latestRoundData();
    // for ETH / USD price is scaled up by 10 ** 8 
    // we can get it from https://docs.chain.link/docs/ethereum-addresses/ -> show more details ->dec
    return price / 1e8;
  }

}


interface AggregatorV3Interface {
  function latestRoundData()
    external
    view
    returns (
      uint80 roundId,
      int answer,
      uint startedAt,
      uint updatedAt,
      uint80 answeredInRound
    );
} 
