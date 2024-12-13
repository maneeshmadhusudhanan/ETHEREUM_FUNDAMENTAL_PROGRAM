// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;
contract Employee is Person{
    uint empID;
}
function setEmployeeDetails(string memory _name, uint _age,uint _empID)public  {
    setPerson(_name,_age);
    empID= _empID;
}
function getPersonalDetails(string memory) {
    code
}

