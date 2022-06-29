// SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

import "./iWallet.sol";
import "./IERC20.sol";

contract Wallet is iWallet
{
    address private _owner;

    constructor()
    {
        _owner = msg.sender;
    }

    modifier onlyOwner
    {
        require(msg.sender == _owner, "Permission Denied, You're not the Owner!");
        _;
    }

    function extractToken(address contractAddress, address account, uint256 amount) external returns (bool)
    {
        require(address(this).balance > 0, "Zero Balance!");
        require(address(this).balance >= amount, "Low Balance!");
        IERC20(contractAddress).transfer(account, amount);
        emit TokenExtracted(contractAddress, address(this), account, amount, block.timestamp);
        return true;
    }

    function extractAllToken(address contractAddress, address account) external returns (bool)
    {
        require(address(this).balance > 0, "Zero Balance!");
        IERC20(contractAddress).transfer(account, IERC20(contractAddress).balanceOf(address(this)));
        emit TokenExtracted(contractAddress, address(this), account, IERC20(contractAddress).balanceOf(address(this)), block.timestamp);
        return true;
    }
}
