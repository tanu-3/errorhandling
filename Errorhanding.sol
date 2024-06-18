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
        }
    }
    function addItem() public {
        catalogue++;
    }
    function payBill() public {
        require(Bill>0,"no bill left");
        require(Bill<balance,"low balance");
            balance -= Bill;
            Bill=0;
    }
    function exitShop() public {
        assert(insideshop);
            Bill= catalogue*40;
            catalogue=0;
            insideshop=false;
    }
    function addMoney(uint amount) public{
         balance += amount;
    }
}


