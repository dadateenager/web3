// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract bank{
    address public immutable owner;
    event Deposit(address _address,uint256 amount);
    event Withdraw(uint256 amount);

    constructor()payable {
        owner = msg.sender;
    }
    receive() external payable {
        emit  Deposit(msg.sender, msg.value);
    }
    function withdraw(uint256 amount) external {
        require(msg.sender == owner,"not owner");
        emit Withdraw(address(this).balance);
        selfdestruct(payable (msg.sender));
    }
    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}