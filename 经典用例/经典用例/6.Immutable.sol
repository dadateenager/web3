// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract iiiImmutable{
    address public immutable my_address ;
    uint256 public immutable my_name;
    constructor(uint256 name) {
        my_address = msg.sender;
        my_name = name;
    }
}