# My Simple Token

A simple ERC20 token implementation in Solidity, demonstrating basic token functionalities such as minting, burning, and transferring tokens.

## Description

MySimpleToken is a straightforward ERC20 token contract written in Solidity. It allows the contract owner to mint new tokens and enables users to burn their own tokens. The contract also includes functions to transfer tokens between addresses and approve allowances for third-party spending.

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
// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract MySimpleToken {
  
  string public name = "My Simple Token";
  string public symbol = "MST";
  uint public decimals = 18;

  uint public totalTokens;
  address public owner;


  mapping(address => uint256) public balances;


  event Transfer(address from, address to, uint amount);
  event Mint(address to, uint amount);
  event Burn(address from, uint256 amount);
  event Approval(address owner, address spender, uint amount);

  constructor(uint startingTokens) {
    owner = msg.sender;
    totalTokens = startingTokens;
    balances[owner] = startingTokens;
    
}

  function mint(address to, uint amount) public {
    if (msg.sender != owner) {
      revert("Only the owner can create more tokens!");
    }

    totalTokens += amount;
    balances[to] += amount;

    emit Mint(to, amount);
  }


  function burn(uint amount) public {

    if (balances[msg.sender] < amount) {
        revert("You don't have enough tokens to burn!");
    }

    totalTokens -= amount;
    balances[msg.sender] -= amount;

    emit Burn(msg.sender , amount); 
  }

  function approve(address spender, uint allowance) public {
    balances[spender] = allowance;
    emit Approval(msg.sender, spender, allowance);
  }

  function transfer(address to, uint amount) public {
    if (balances[msg.sender] < amount) {
      revert("Insufficient balance to send tokens!");
    }

    if (to == address(0)) {
      revert("Sending tokens to nobody isn't possible!");
    }

    balances[msg.sender] -= amount;
    balances[to] += amount;

    emit Transfer(msg.sender, to, amount);
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
