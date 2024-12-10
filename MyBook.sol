// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract MyBook {
    // Variables
    string public title;
    uint16 public price;
    address public owner;
    address public buyer;
    bool public sold;

    // Events
    event BookDetailsSet(string title, uint16 price);
    event BookPurchased(address buyer, uint256 amount);
    event RefundIssued(address buyer, uint256 amount);

    // Modifiers
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    modifier onlyNotSold() {
        require(!sold, "Book already sold");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    // Seller sets book details
    function setBookDetails(string memory _title, uint16 _price) public onlyOwner {
        require(bytes(_title).length > 0, "Title cannot be empty");
        require(_price > 0, "Price must be greater than zero");

        title = _title;
        price = _price;
        sold = false;
        buyer = address(0);

        emit BookDetailsSet(_title, _price);
    }

    // Utility function to convert ETH to Wei
    function ethToWei(uint256 eval) public pure returns (uint256) {
        return eval * 1 ether;
    }

    // Buyer purchases the book
    function buyBook() public payable onlyNotSold {
        uint256 weiPrice = ethToWei(price);
        require(msg.value >= weiPrice, "Insufficient funds");

        uint256 balanceToReturn = msg.value - weiPrice;

        // Transfer price to seller
        payable(owner).transfer(weiPrice);

        // Refund any excess funds to buyer
        if (balanceToReturn > 0) {
            payable(msg.sender).transfer(balanceToReturn);
            emit RefundIssued(msg.sender, balanceToReturn);
        }

        // Update state variables
        buyer = msg.sender;
        sold = true;

        emit BookPurchased(msg.sender, weiPrice);
    }

    // Retrieve book details
    function getBookDetails() public view returns (string memory, uint16, bool) {
        return (title, price, sold);
    }
}
