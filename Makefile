-include .env

.PHONY: all test clean deploy-sepolia

all: clean install build

# Clean the repo
clean  :; forge clean

# Install the Forge dependencies
install :; forge install

# Build the project
build  :; forge build

# Run tests
test   :; forge test

# Run tests with gas reporting
test-gas   :; forge test --gas-report

# Format code
format :; forge fmt

# Deploy to Sepolia
deploy-sepolia :; forge script script/Deploy.s.sol:Deploy --rpc-url ${SEPOLIA_RPC_URL} --broadcast --verify -vvvv 