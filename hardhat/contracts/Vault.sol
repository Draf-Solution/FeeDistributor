//SPDX-License-Identifier: Unlicense
pragma solidity 0.8.4;

import "@openzeppelin/contracts/finance/PaymentSplitter.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Vault is ReentrancyGuard, PaymentSplitter, Ownable{
    //using SafeMath for uint256;

    address[] addrStakeHolders = [0x4ae4F1a81B260ea5333FB12f667cCe9A2B438b6d, 
        0x513715bAC5551dfd9DaaB045B853a3FA6a092827,
        0x25046eD83e4a5aE8d2906e2882B8f4Ee25A5377e];
    uint256[] intShares = [10,20,70];



    constructor() PaymentSplitter(addrStakeHolders,intShares) {

        //tokensAdded.push(TokenAddr);
    }

    function balance(address owner) public view returns (uint256)
    {
        //address payable self = address(this);
        uint256 intBalance = owner.balance;
        return intBalance;
    }

    function vaultBalance() public view returns (uint256)
    {
        //address payable self = address(this);
        uint256 intBalance = address(this).balance;
        return intBalance;
    }


    function vaultBalanceERC20(IERC20 token) public view returns (uint256)
    {
        //address payable self = address(this);
        uint256 intBalance = token.balanceOf(address(this));
        return intBalance;
    }

    function releaseAll(IERC20 token)  public nonReentrant() onlyOwner() {
        
        
        release(token,addrStakeHolders[0]);
        release(token,addrStakeHolders[1]);
        release(token,addrStakeHolders[2]);

  
        /*
        release(addrStakeHolders[0]);
        release(addrStakeHolders[2]);
        release(addrStakeHolders[3]);
        */
    }


    function releaseAll()  public nonReentrant() onlyOwner() {
        
        address payable addrStakeHolder = payable(address(addrStakeHolders[0]));
        release(addrStakeHolder);
        addrStakeHolder = payable(address(addrStakeHolders[1]));        
        release(addrStakeHolder);
        addrStakeHolder = payable(address(addrStakeHolders[2]));
        release(addrStakeHolder);
  
        /*
        release(addrStakeHolders[0]);
        release(addrStakeHolders[2]);
        release(addrStakeHolders[3]);
        */
    }


}
