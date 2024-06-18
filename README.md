# Error Handling

The basic purpose is to make code more accurate by using error handling statements that is require, revert and assert statements.

## Description

We created a smart contract name AutomaticShop. In this, users enter in a shop add items and exit and then the payment is cut from phone directly without giving in shop.This includes functions such as enterShop,addItem, payBill,exitShop and addMoney for all functioning of error handling concepts.

## Getting Started

### Installing

* How/where to download your program
* Any modifications needed to be made to files/folders

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., HelloWorld.sol). Copy and paste the following code into the file:
```javascript
// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;
contract AutomaticShop {
    uint public catalogue=0;
    uint public Bill=0;
    uint public balance=0;
    bool insideshop=false;
    function enterShop() public {
         catalogue=0;
         insideshop=true;
         if(Bill !=0){
         revert("pay prev Bill");
        }}
    function addItem() public {
        catalogue++;
    }
    function payBill() public {
        require(Bill>0,"no bill left");
        require(Bill<balance,"low balance");
            balance -= Bill;
            Bill=0;}
    function exitShop() public {
        assert(insideshop);
            Bill= catalogue*40;
            catalogue=0;
            insideshop=false;}
    function addMoney(uint amount) public{
         balance += amount;
    }
}

```
## Authors

TANU PAL
@Tanu


## License

This project is licensed under the Meta License.
