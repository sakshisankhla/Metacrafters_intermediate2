# My Simple Token

A simple ERC20 token implementation in Solidity, demonstrating basic token functionalities such as minting, burning, and transferring tokens.

## Description

MySimpleToken is a straightforward ERC20 token contract written in Solidity. It allows the contract owner to mint new tokens and enables users to burn their own tokens. The contract also includes functions to transfer tokens between addresses.

## Getting Started

### Installing

1. Clone the repository or download the `MySimpleToken.sol` file.
2. Open the file in a Solidity-compatible development environment (for eg. Remix)

### Executing program

* How to run the program on Remix
  1. Open Remix

  2. Create a New File:
   - In the File Explorer on the left side, click the "+" button to create a new file.
   - Name the file `MySimpleToken.sol`.

3. **Copy and Paste the Code:**
   - Copy the `MySimpleToken` contract code and paste it into the new file.

```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SakshiZeppelin {
    string public tokenName = "SakshiSankhla";
    string public tokenAbbr = "SS";

    address owner;

    mapping(address => uint) record;

    constructor() {
        owner = msg.sender;
    }

    function getBalance() external view returns (uint) {
        return record[msg.sender];
    }

    // New function to fetch balance by inputting an account address
    function getBalanceOf(address account) external view returns (uint) {
        return record[account];
    }

    function mint(address to, uint amount) external {
        require(msg.sender == owner, "Only owner can mint tokens");
        record[to] += amount;
    }

    function transferTo(address to, uint amount) external {
        require(record[msg.sender] >= amount, "Insufficient balance in the account");
        record[to] += amount;
        record[msg.sender] -= amount;
    }

    function burn(uint amount) external {
        require(record[msg.sender] >= amount, "Insufficient balance in the account");
        record[msg.sender] -= amount;
    }
}
```
4.Compile the Contract:

-Click on the "Solidity Compiler" tab (second tab from the top in the left sidebar).
-Ensure the compiler version is set a compatible version.
-Click the "Compile MySimpleToken.sol" button.

5.Deploy the Contract:

-Click on the "Deploy & Run Transactions" tab (third tab from the top in the left sidebar).
-Ensure "MySimpleToken" is selected in the "Contract" dropdown.
-Click the "Deploy" button.

6.Interact with the Contract:

-Once deployed, the contract will appear under "Deployed Contracts" at the bottom of the "Deploy & Run Transactions" tab.
You can now interact with the contract functions.

## Help

-Ensure you are using the correct Solidity compiler version.
-If a function call reverts, check the age parameter you are passing to ensure it meets the minimum age requirement.

## Authors

Sakshi Sankhala

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.
