// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Example {
    event ValueChanged(address indexed author, uint256 newValue);
    
    uint256 public value;

    function setValue(uint256 newValue) public {
        value = newValue;
        emit ValueChanged(msg.sender, newValue);
    }
} 