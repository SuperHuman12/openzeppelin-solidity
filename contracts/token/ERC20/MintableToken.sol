pragma solidity ^0.4.24;

import "./ERC20.sol";
import "../../access/roles/MinterRole.sol";

/**
 * @title MintableToken
 * @dev ERC20 minting logic
 */
contract MintableToken is ERC20, MinterRole {
  /**
   * @dev Function to mint tokens
   * @param to The address that will receive the minted tokens.
   * @param value The amount of tokens to mint.
   * @return A boolean that indicates if the operation was successful.
   */
  function mint(
    address to,
    uint256 value
  )
    public
    onlyMinter
    returns (bool)
  {
    _mint(to, value);
    return true;
  }
}
