// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Variables{
    string abc = "hello";

    function hello() public pure returns(uint) {
        uint x = 123;
        return x;
    }
    function globalvar() public view {
        address m = msg.sender;
        uint256 timestamp = block.timestamp;
    }
}