// Copyright 2021-2022, Offchain Labs, Inc.
// For license information, see https://github.com/OffchainLabs/nitro-contracts/blob/main/LICENSE
// SPDX-License-Identifier: BUSL-1.1

pragma solidity >=0.4.21 <0.9.0;

/// @title Provides owners with tools for managing the blacklist configuration.
/// @notice Calls by non-owners will always revert.
/// Precompiled contract that exists in Deriw chain at 0x00000000000000000000000000000000000007EC.
interface DeriwBlacklist {
    /// @notice Add account as a blacklist owner
    function addBlacklistOwner(address newOwner) external;

    /// @notice Remove account from the list of blacklist owners
    function removeBlacklistOwner(address ownerToRemove) external;

    /// @notice See if the user is a blacklist owner
    function isBlacklistOwner(address addr) external view returns (bool);

    /// @notice Retrieves the list of blacklist owners
    function getAllBlacklistOwners() external view returns (address[] memory);

    /// Emitted when a successful call is made to this precompile
    event OwnerActs(bytes4 indexed method, address indexed owner, bytes data);

    /// @notice Retrieves the blacklist transaction sender list
    function getBlacklistTxFrom() external view returns (address[] memory);

    /// @notice Retrieves the blacklist transaction target list
    function getBlacklistTxTo() external view returns (address[] memory);

    /// @notice Add a sender address to the blacklist
    function addBlacklistTxFrom(address addr) external;

    /// @notice Add a target address to the blacklist
    function addBlacklistTxTo(address addr) external;

    /// @notice See if the sender address is blacklisted
    function isBlacklistTxFrom(address addr) external view returns (bool);

    /// @notice See if the target address is blacklisted
    function isBlacklistTxTo(address addr) external view returns (bool);

    /// @notice Remove sender address from the blacklist
    function removeBlacklistTxFrom(address addr) external;

    /// @notice Remove target address from the blacklist
    function removeBlacklistTxTo(address addr) external;

    /// @notice Legacy scheduler retained for historical DeriwOS 1-3 replay.
    /// @dev Deprecated. This endpoint rejects DeriwOS 4 and every later
    /// version. Use ArbOwner.scheduleDeriwOSUpgrade instead.
    function scheduleDeriwOSUpgrade(uint64 newVersion, uint64 timestamp) external;
}
