// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WETH{
    string public name = "Wrapper ETH";
    string public symbol = "WETH";

    uint256 public balance;
    mapping (address=>uint256) public balanceOf;
    mapping (address=>mapping (address=>uint256)) public allowance;
    event TransferFrom(address src,address toAds,uint256 amount);
    event Withdraw(address toAds,uint256 amount);
    event Approve(address fromAds,address toAds,uint256 amount);
    event Deposit(address fromAds,uint256 amount);

    function transfer(address toAds,uint256 amount)public returns (bool){
        return transferFrom(msg.sender, toAds, amount);
    }
    function deposit()payable public returns (bool) {
        balanceOf[msg.sender]+=msg.value;
        emit Deposit(msg.sender,msg.value);
        return true;
    }
    function withdraw(address toAds,uint256 amount)public returns (bool){
        require(balanceOf[toAds]>=amount,"not enough balance");
        balanceOf[toAds]-=amount;
        payable (toAds).transfer(amount);
        emit Withdraw(toAds, amount);
        return true;
    }
    function totalSupply()public view returns (uint256){
        return address(this).balance;
    }
    function approve(address toAds,uint256 amount)public returns (bool) {
        allowance[msg.sender][toAds] = amount;
        emit Approve(msg.sender,toAds, amount);
        return true;
    }
    //授权代扣
    function transferFrom(address src,address toAds,uint256 amount)public returns (bool) {
        //验证授权的账户是否足够金额
        //验证是否授权足够金额
        require(balanceOf[src]>=amount,"not enough balance of source");
        if(src!=msg.sender){
            require(allowance[src][msg.sender]>=amount,"not enough allowance");
            allowance[src][msg.sender]-=amount;
        }
        balanceOf[src]-=amount;
        balanceOf[toAds]+=amount;
        emit TransferFrom(src, toAds, amount);
        return true;
        
    }
    receive() external payable { 
        deposit();
    }
    fallback() external payable { 
        deposit();
    }
}