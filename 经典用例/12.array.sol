// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract array{
    //initlize only three
    uint256[] arr;
    uint256[3] arr2;//initlize 0
    uint256[] arr3 = [1,2,3];
    function get(uint256 i) public view returns (uint256){
        return arr[i];
    }
    function push(uint256 i ) public {
        arr.push(i);

    }
    function pop() public{
        arr.pop();
    }
    function remove(uint256 i ) public{
        delete arr[i];
    }
    function getlength() public returns (uint256){
        return arr.length;
    }
    function example() external  {
        // create array in memory, only fixed size can be created
        uint[] memory arr4 = new uint[](5);
    }
}