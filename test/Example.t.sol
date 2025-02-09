// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/Example.sol";

contract ExampleTest is Test {
    Example public example;
    address public user;

    function setUp() public {
        user = makeAddr("user");
        example = new Example();
    }

    function test_SetValue() public {
        example.setValue(42);
        assertEq(example.value(), 42);
    }

    function testFuzz_SetValue(uint256 newValue) public {
        example.setValue(newValue);
        assertEq(example.value(), newValue);
    }

    function test_EmitsEvent() public {
        vm.expectEmit(true, false, false, true);
        emit Example.ValueChanged(address(this), 42);
        example.setValue(42);
    }
} 