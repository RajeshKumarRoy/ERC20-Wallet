// SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

interface iWallet
{
    event TokenExtracted(address indexed contractAddress, address indexed from, address indexed to, uint256 amount, uint256 timestamp);

    function extractToken(address contractAddress, address account, uint256 amount) external returns (bool);
    function extractAllToken(address contractAddress, address account) external returns (bool);
}
