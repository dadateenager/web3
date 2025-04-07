// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract errorrrr{
    function testrequire(uint i) public pure{
        require(i>10,"i need >10");
        
    }
    function testrevert(uint _i)public pure{
        if (_i<10){
            revert("i must need > 10");
        }
    }
    error InsufficientBalance(uint256 balance, uint256 withdrawAmount);
    function testCustomError(uint256 _withdrawAmount) public view {
        uint256 bal = address(this).balance;
        if (bal < _withdrawAmount) {
            revert InsufficientBalance({
                balance: bal,
                withdrawAmount: _withdrawAmount
            });
        }
    }
    
}