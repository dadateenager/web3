// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Primitive{
    bool a = true;
    string b = "hello world";
    uint256 c = 123;
    int256 d = type(int256).min;
    int256 e = type(int256).max;
    address public f = 0x0123456789012345678901234567890123456789; 
    bytes1 g = 0xab;
}