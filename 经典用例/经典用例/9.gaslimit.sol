// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract gaslimit {
    uint256 i ;
    function forever() public {
        while (true){
        i++;
        }
    }
    
}