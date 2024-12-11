// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract Question1 {
    uint16 public num1;
    uint16 public num2;
    uint16 public num3;

function findLargest(uint _num1,uint _num2,uint _num3)public pure returns (uint){
    if (_num1>_num2 && _num1>_num3){
        return _num1;
        }else if (_num2>_num3){
            return _num2;
        }else{
            return _num3;
        }
      }
    }
    