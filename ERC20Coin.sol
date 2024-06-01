// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Sisoncoin {
    //Public variables
    string public coinName = "Sisoncoin";
    string public coinSymbol = "SSC";
    uint public coinSupply = 0;
    // Mapping to track balances
    mapping(address => uint) public coinBalances;
    //Mint function
    function mintCoins(address to, uint amount) public {
        coinSupply += amount;
        coinBalances[to] += amount;
    }
    //Burn function
    function burnCoins(address from, uint amount) public {
        require(coinBalances[from] >= amount, "Insufficient balance to burn");
        coinSupply -= amount;
        coinBalances[from] -= amount;
    }
    //Transfer function
    function transferCoins(address from, address recipient, uint amount) public {
        require(coinBalances[from] >= amount, "Insufficient balance to transfer");
        coinBalances[from] -= amount;
        coinBalances[recipient] += amount;
        coinSupply -= amount;
    }
}
