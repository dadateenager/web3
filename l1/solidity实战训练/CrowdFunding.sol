// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
// 众筹合约分为两种角色：一个是受益人，一个是资助者。

// // 两种角色:
// //      受益人   beneficiary => address         => address 类型
// //      资助者   funders     => address:amount  => mapping 类型 或者 struct 类型
// 状态变量按照众筹的业务：
// // 状态变量
// //      筹资目标数量    fundingGoal
// //      当前募集数量    fundingAmount
// //      资助者列表      funders
// //      资助者人数      fundersKey
// 需要部署时候传入的数据:
// //      受益人
//      筹资目标数量
contract CrowdFunding{
    address public immutable beneficiary;//受益人
    uint256 public immutable fundingGoal; //募捐目标
    mapping(address=>uint256) public funders;
    uint256 public fundersKey; //资助人数
    uint256 public fundingAmount;//当前资助额度
    bool public closed=true;
    constructor(address beneAds,uint256 amount){
        beneficiary=beneAds;
        fundingGoal = amount;
    }
    function contribute() public payable { 
        require(closed == true,"funding is closed");
        require(fundingGoal>msg.value,"funding is enough");
        require(msg.value>10,"contribute at least 10");
        funders[msg.sender] += msg.value;
        fundingAmount+=msg.value;
        fundersKey+=1;
    }

    function close()public returns (bool){ //关闭拒绝捐款，并将总额捐给受益人
        require(closed==true,"funding is closed");
        if (fundingAmount<fundingGoal){
            return false;
        }
        closed = false;
        fundingAmount = 0;
        payable (beneficiary).transfer(fundingAmount);
        return true;
    }
    function getFundersKey()public view returns (uint256){
        return fundersKey;
    }




}