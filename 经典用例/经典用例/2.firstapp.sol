// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FirstContract {
    int8 private  count = 0;

    function  get() public view returns (int8) {
        return count;
    }
    function increment()public  {
        count++;
    }
    function decrement()public {
        count--;
    }

}