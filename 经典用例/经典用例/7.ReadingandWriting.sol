// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract readandwrite{
    uint256 private number;
    function set(uint256 _number) public {
        number = _number;
    }
    function get() public view returns(uint256){
        return number;
    }
}