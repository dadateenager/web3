// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Mapping {
    mapping (address => uint256) public mymapping;
    function set(address k,uint256 value) public  {
        mymapping[k] = value;
    }
    function get(address k) public view returns (uint256){
        return mymapping[k];
    }
    function remove(address k) public{
        delete mymapping[k];
    }

}

contract mymapmap{
    mapping (address =>mapping (uint256 => bool)) public mymapping;
    function set(address key, uint256 value1) public  {
        mymapping[key][value1] = true;
    }
    function get(address k,uint256 v1) public view returns (bool) {
        return mymapping[k][v1];
    }
    function remove(address k,uint256 v1) public{
        delete mymapping[k][v1];
    }
}