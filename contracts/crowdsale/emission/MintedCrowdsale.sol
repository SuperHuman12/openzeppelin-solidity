pragma solidity ^0.4.24;

import "../Crowdsale.sol";
import "../../token/ERC20/MintableToken.sol";

/**
 * @title MintedCrowdsale
 * @dev Extension of Crowdsale contract whose tokens are minted in each purchase.
 * Token ownership should be transferred to MintedCrowdsale for minting.
 */
contract MintedCrowdsale is Crowdsale {
  constructor() internal {}

  /**
   * @dev Overrides delivery by minting tokens upon purchase.
   * @param beneficiary Token purchaser
   * @param tokenAmount Number of tokens to be minted
   */
  function _deliverTokens(
    address beneficiary,
    uint256 tokenAmount
  )
    internal
  {
    // Potentially dangerous assumption about the type of the token.
    require(
      MintableToken(address(token())).mint(beneficiary, tokenAmount));
  }
}
