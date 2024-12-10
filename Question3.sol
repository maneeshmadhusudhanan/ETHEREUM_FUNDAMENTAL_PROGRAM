// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract EmployeeRecord {
    // Structure to store employee details
    struct Employee {
        string name;
        string department;
        string designation;
        uint256 salary;
    }

    address public owner;
    mapping(address => Employee) private employees;

    // Modifier to restrict access to the contract owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    // Constructor to set the contract deployer as the owner
    constructor() {
        owner = msg.sender;
    }

    // Function to set employee details
    function setEmployeeDetails(
        address _walletAddress,
        string memory _name,
        string memory _department,
        string memory _designation,
        uint256 _salary
    ) public onlyOwner {
        require(_walletAddress != address(0), "Invalid wallet address");
        employees[_walletAddress] = Employee(_name, _department, _designation, _salary);
    }

    // Function to get employee details
    function getEmployeeDetails(address _walletAddress)
        public
        view
        returns (
            string memory, string memory, string memory, uint256
        )
    {
        Employee memory emp = employees[_walletAddress];
        require(bytes(emp.name).length > 0, "Employee does not exist");
        return (emp.name, emp.department, emp.designation, emp.salary);
    }

    // Function to pay the employee
    function payEmployee(address _walletAddress) public payable onlyOwner {
        Employee memory emp = employees[_walletAddress];
        require(bytes(emp.name).length > 0, "Employee does not exist");
        require(msg.value == emp.salary, "Incorrect payment amount");

        payable(_walletAddress).transfer(msg.value);
    }
}
