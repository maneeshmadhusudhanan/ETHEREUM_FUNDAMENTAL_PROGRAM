// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;
contract Bank {
    mapping (address=>uint) balanceLedger;
    address public admin;
    constructor(){
        admin= msg.sender;
    }

    modifier balanceCheck(uint amt){
        require(balanceLedger[msg.sender] >= amt, "Insufficient Balance");
        _;
    }

    function deposit()public payable{
        require(msg.sender);
        balanceLedger[msg.sender] = balanceLedger[msg.sender]+msg.value;
    }
    function getBalance() public view returns (uint) {
        return  balanceLedger[msg.sender];

    }
    function withdraw(uint amt)public  balanceCheck(amt) {
        require(balanceLedger[msg.sender] >= amt,"Insufficient Balance");
        balanceLedger[msg.sender] = balanceLedger[msg.sender] - amt;
        payable (msg.sender).transfer(amt);
    }
    function Transfer(uint amt,address recipient)public  {
        require(balanceLedger[msg.sender] >= amt,"TRANSFER SUCESS");
        balanceLedger[msg.sender] = balanceLedger[msg.sender] - amt;
        payable (recipient).transfer(amt);
    }
    
}