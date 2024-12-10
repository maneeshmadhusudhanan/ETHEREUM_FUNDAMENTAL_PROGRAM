// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract MathFunctions {
    // Function to find the largest among three numbers
    function findLargest(int256 num1, int256 num2, int256 num3) public pure returns (int256) {
        return (num1 >= num2 && num1 >= num3) ? num1 : (num2 >= num1 && num2 >= num3) ? num2 : num3;
    }

    // Function to convert a single-digit number to its word representation
    function getDigit(uint8 digit) public pure returns (string memory) {
        require(digit < 10, "Invalid input: Not a single-digit number");
        string[10] memory digits = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"];
        return digits[digit];
    }

    // Function to check the sign of an integer
    function checkSign(int256 value) public pure returns (string memory) {
        return value > 0 ? "positive" : value < 0 ? "negative" : "zero";
    }
}
