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
