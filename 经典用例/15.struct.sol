// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract structtt {
    struct Todo{
        string text;
        bool completed;
    }
    Todo[] public todolist; 
    function create(string calldata _text) public {
        todolist.push(Todo(_text,false));
    }
    function updateText(uint256 _index,string calldata _text) public {
        todolist[_index].text = _text;
    }
    function updateCompleted(string calldata _text) public{
        for (uint256 i = 0 ;i<todolist.length;i++) {
            if(keccak256(bytes(todolist[i].text)) == keccak256(bytes((_text)))){
                todolist[i].completed = !todolist[i].completed;
            }
        }
    }
    
}