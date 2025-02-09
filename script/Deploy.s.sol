// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import "../src/Example.sol";

contract Deploy is Script {
    function run() public {
        vm.startBroadcast();
        
        new Example();
        
        vm.stopBroadcast();
    }
} 