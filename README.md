# EVM Smart Contract Template

A ready-to-use Foundry template for Ethereum smart contract development. Clone and start coding immediately without the hassle of setting up boilerplate.

## Features

- Pre-configured Foundry setup
- Optimized compiler settings
- Testing environment ready
- OpenZeppelin contracts support
- CI-ready configuration
- Standard project structure
- GitHub Actions CI workflow
- Solhint linting configuration
- Makefile for common commands
- Automated testing setup

## Getting Started

### Prerequisites

* [Git](https://git-scm.com/)
* [Foundry](https://book.getfoundry.sh/getting-started/installation)

### Installation

1. Click "Use this template" on GitHub to create a new repository
2. Clone your repository:
   ```bash
   git clone <YOUR_REPOSITORY_URL>
   cd <YOUR_REPOSITORY_NAME>
   ```
3. Install dependencies:
   ```bash
   forge install OpenZeppelin/openzeppelin-contracts
   ```

### Initial Setup

1. Install dependencies:
```bash
make install
# or
forge install
```

2. Build the project:
```bash
make build
# or
forge build
```

3. Run tests:
```bash
make test
# or
forge test
```

### Available Commands

The template includes a Makefile for common commands:

```bash
# Clean the repo
make clean

# Install dependencies
make install

# Build the project
make build

# Run tests
make test

# Run tests with gas reporting
make test-gas

# Format code
make format

# Deploy to Sepolia
make deploy-sepolia
```

### Continuous Integration

The template comes with a GitHub Actions workflow that:
- Runs on every push and pull request
- Installs Foundry
- Builds the project
- Runs the test suite
- Reports contract sizes

### Code Style & Linting

The project uses Solhint for Solidity linting with a custom configuration. To use it:

1. Install Solhint:
```bash
npm install -g solhint
```

2. Run linter:
```bash
solhint "src/**/*.sol"
```

The included `.solhint.config.js` provides sensible defaults for Solidity development.

### Project Structure

```
.
├── src/                # Source contracts
├── test/              # Test files
├── script/            # Deploy/interaction scripts
└── lib/               # Dependencies
```

### Quick Start Commands

```bash
# Build
forge build

# Test
forge test

# Test with gas reporting
forge test --gas-report

# Format code
forge fmt

# Deploy
forge script script/Deploy.s.sol --rpc-url <RPC_URL> --broadcast
```

## Development

1. Add your contracts to `src/`
2. Write tests in `test/`
3. Add deployment scripts in `script/`
4. Copy `.env.example` to `.env` and fill in your variables

### Testing Best Practices

#### Test Structure
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/YourContract.sol";

contract YourContractTest is Test {
    // Contract instance
    YourContract public yourContract;
    
    // Test accounts
    address public owner;
    address public user;
    
    // Setup runs before each test
    function setUp() public {
        owner = makeAddr("owner");
        user = makeAddr("user");
        
        vm.startPrank(owner);
        yourContract = new YourContract();
        vm.stopPrank();
    }
}
```

#### Naming Conventions

- Test files should end with `.t.sol`
- Test functions should start with `test`
- Failure test functions should start with `testRevert`
- Fuzz test functions should start with `testFuzz`
- Invariant test functions should start with `invariant`

```solidity
function test_BasicFunctionality() public {
    // Test happy path
}

function testRevert_WhenInvalidInput() public {
    // Test failure case
}

function testFuzz_WithDifferentInputs(uint256 randomInput) public {
    // Fuzz test
}
```

#### Testing Patterns

1. **State Changes**
```solidity
function test_StateChange() public {
    uint256 initialValue = yourContract.getValue();
    yourContract.setValue(42);
    assertEq(yourContract.getValue(), 42);
}
```

2. **Event Emissions**
```solidity
function test_EventEmission() public {
    vm.expectEmit(true, false, false, true);
    emit ValueChanged(address(this), 42);
    yourContract.setValue(42);
}
```

3. **Access Control**
```solidity
function testRevert_OnlyOwner() public {
    vm.prank(user);
    vm.expectRevert("Not owner");
    yourContract.adminFunction();
}
```

4. **Fuzz Testing**
```solidity
function testFuzz_ValueIsAlwaysValid(uint256 randomValue) public {
    vm.assume(randomValue != 0);  // Skip zero value
    yourContract.setValue(randomValue);
    assertGt(yourContract.getValue(), 0);
}
```

#### Useful Testing Utilities

- `vm.prank(address)`: Next call will be made by specified address
- `vm.startPrank(address)`: All subsequent calls will be made by specified address
- `vm.deal(address, uint256)`: Set ETH balance of address
- `vm.expectRevert()`: Expect next call to revert
- `vm.expectEmit()`: Expect specific event to be emitted
- `makeAddr(string)`: Create address from string
- `deal(address, uint256)`: Set token balance for ERC20
- `vm.warp(uint256)`: Set block timestamp
- `vm.roll(uint256)`: Set block number

#### Testing Tips

1. Test both positive and negative cases
2. Use meaningful test names that describe the scenario
3. Group related tests together
4. Use setup functions to avoid code duplication
5. Test edge cases and boundaries
6. Use fuzz testing for numeric inputs
7. Test events and state changes separately
8. Mock external dependencies when needed

## License

MIT
