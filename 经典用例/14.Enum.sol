// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Enummmm{
    enum State{
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }
    State public state;
    function get() public view returns (State){
        return state; 
    }
    function set(State _state) public {
        state = _state;
    }
    function cancel() public {
        state = State.Canceled;
    }
    function reset()public {
        delete state;
    }
}