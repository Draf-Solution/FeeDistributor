# FundsDistributor

Currently Opensea only supports royalty fees to be sent to only one address. In order to utilize Opensea's framework but have the royalty fees to be distributed in a ratio predefined, this smartcontract is created to store the funds from the royalty fee and eventually be distributed to the respective EOAs addresses

Splits all the Native and ERC20 tokens to 3 EOA addresses after the withdraw function is pressed.

The 3 EOA addresses will receive the funds in the following ratios:-

1) 10%
2) 20%
3) 70%

From Openzepplin, Payment Splitter is inheritted and enhanced with the following functions:-

1) Vault balances for native and ERC20 token
2) One function call to release all the tokens to respective owners

## Please remember to change the Deployment Private Key!!!!