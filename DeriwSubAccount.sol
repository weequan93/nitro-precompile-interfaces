// Copyright 2021-2022, Offchain Labs, Inc.
// For license information, see https://github.com/OffchainLabs/nitro-contracts/blob/main/LICENSE
// SPDX-License-Identifier: BUSL-1.1

pragma solidity >=0.4.21 <0.9.0;

/// @title Provides owners with tools for managing sub-account configuration.
/// Precompiled contract that exists in Deriw chain at 0x00000000000000000000000000000000000007EA.
interface DeriwSubAccount {
    /// @notice Add sub-account owner
    function addSubAccountOwner(address newOwner) external;

    /// @notice Remove sub-account owner
    function removeSubAccountOwner(address ownerToRemove) external;

    /// @notice See if the user is a sub-account owner
    function isSubAccountOwner(address addr) external view returns (bool);

    /// @notice Add smart contract address that allows sub-account interaction
    function addAllowedAddress(address newAddress) external;

    /// @notice Remove smart contract address that allows sub-account interaction
    function removeAllowedAddress(address addressToRemove) external;

    /// @notice Check whether the address is allowed for sub-account interaction
    function isAllowedAddress(address addr) external view returns (bool);

    /// @notice Retrieves the smart contract addresses that allow sub-account interaction
    function getAllAllowedAddress() external view returns (address[] memory);

    /// @notice Retrieves the list of sub-account owners
    function getAllSubAccountOwner() external view returns (address[] memory);

    /// @notice Set USDT address, so only approve methods are allowed for sub-account interaction
    function addUsdtAddress(address newAddress) external;

    /// @notice Reset all child-parent relationships
    function resetAllRelationship() external;

    /// @notice Reset child-parent relationships up to a given size
    function resetAllRelationshipByIndex(uint64 size) external;

    /// @notice Remove USDT address
    function removeUsdtAddress(address addressToRemove) external;

    /// @notice Retrieve USDT address status
    function isUsdtAddress(address addr) external view returns (bool);

    /// @notice Retrieves addresses that allow USDT sub-account interaction
    function getAllUsdtAddress() external view returns (address[] memory);

    /// @notice Reset a child-parent relationship by position
    function resetAllRelationshipByPosition(address addr) external;

    /// Emitted when a successful call is made to this precompile
    event OwnerActs(bytes4 indexed method, address indexed owner, bytes data);
}
