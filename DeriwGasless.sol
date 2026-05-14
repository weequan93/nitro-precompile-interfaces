// Copyright 2021-2022, Offchain Labs, Inc.
// For license information, see https://github.com/OffchainLabs/nitro-contracts/blob/main/LICENSE
// SPDX-License-Identifier: BUSL-1.1

pragma solidity >=0.4.21 <0.9.0;

/// @title Provides owners with tools for managing the gasless configuration.
/// @notice Calls by non-owners will always revert.
/// Precompiled contract that exists in Deriw chain at 0x00000000000000000000000000000000000007E8.
interface DeriwGasless {
    /// @notice Add account as a gasless owner
    function addGaslessOwner(address newOwner) external;

    /// @notice Remove account from the list of gasless owners
    function removeGaslessOwner(address ownerToRemove) external;

    /// @notice See if the user is a gasless owner
    function isGaslessOwner(address addr) external view returns (bool);

    /// @notice Retrieves the list of gasless owners
    function getAllGaslessOwners() external view returns (address[] memory);

    /// Emitted when a successful call is made to this precompile
    event OwnerActs(bytes4 indexed method, address indexed owner, bytes data);

    /// @notice Retrieves the allowed list of gasless transaction senders
    function getPricerTxFromAddrs() external view returns (address[] memory);

    /// @notice Retrieves the allowed list of gasless transaction targets
    function getPricerTxToAddrs() external view returns (address[] memory);

    /// @notice Add an address that can send gasless transactions
    function addPricerTxFrom(address addr) external;

    /// @notice Add a transaction target address for gasless transactions
    function addPricerTxTo(address addr) external;

    /// @notice See if the sender address is in the gasless transaction list
    function isPricerTxFrom(address addr) external view returns (bool);

    /// @notice See if the target address is in the gasless transaction list
    function isPricerTxTo(address addr) external view returns (bool);

    /// @notice Remove sender address from the gasless transaction list
    function removePricerTxFrom(address addr) external;

    /// @notice Remove target address from the gasless transaction list
    function removePricerTxTo(address addr) external;
}
