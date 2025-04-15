// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EtherWallet{

    address payable public immutable owner;
    event Log(string funName, address from, uint256 value, bytes data);
    constructor(){
        owner = payable (msg.sender); 
    }
    receive() external payable {
        emit Log('receive', msg.sender, msg.value, "");
    }
    fallback() external payable { 
        emit Log('receive', msg.sender, msg.value, "");
    }
    function withdraw1() public { //transfer
        require(owner == msg.sender,"not onwer");
        payable (msg.sender).transfer(address(this).balance);
    }
    function withdraw2() public { //send
        require(owner == msg.sender,"not onwer");
        bool success = payable (msg.sender).send(200);
        require(success==true,"fail to withdraw!");
    }
    function withdraw3() public { //call
        require(owner == msg.sender,"not onwer");
        (bool success, )= msg.sender.call{value:200}("");
        require(success==true,"fail to withdraw!");
    }
    function getBalance()public view returns (uint){
        return address(this).balance;
    }
}