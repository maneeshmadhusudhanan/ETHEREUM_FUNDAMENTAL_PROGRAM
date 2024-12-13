
// pragma solidity 0.8.28;

// contract LeapYearChecker {
    // Function to check if a year is a leap year
//     function isLeapYear(uint16 year) public pure returns (bool) {
//         require(year >= 1000 && year <= 9999, "Invalid input: Year must be a 4-digit number");
//         return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
//     }
// }

// pragma solidity 0.8.28;


// contract


// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract LeapYearChecker {
    
    uint16 public year;

    function setYear(uint16 _year) public {
        year = _year;
    }

    function isLeapYear() public view  returns (string memory) {
        
        if (year < 1000 || year > 9999) {
            return "Invalid Input: Not a 4-digit number";
        }


        if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
            return "Leap Year";
        } else {
            return "Not a Leap Year";
        }
    }
}
