// Copyright 2021-2022, Offchain Labs, Inc.
// For license information, see https://github.com/OffchainLabs/nitro-contracts/blob/main/LICENSE
// SPDX-License-Identifier: BUSL-1.1

pragma solidity >=0.4.21 <0.9.0;

/// @title Provides non-owners with info about the gasless configuration.
/// @notice Precompiled contract that exists in Deriw chain at 0x00000000000000000000000000000000000007E7.
interface DeriwGaslessPublic {
    /// @notice See if the user is a gasless owner
    function isGaslessOwner(address addr) external view returns (bool);

    /// @notice Rectify the list of gasless owners
    function rectifyGaslessOwner(address ownerToRectify) external;

    /// @notice Retrieves the list of gasless owners
    function getAllGaslessOwners() external view returns (address[] memory);

    /// @notice Retrieves the allowed list of gasless transaction senders
    function getPricerTxFromAddrs() external view returns (address[] memory);

    /// @notice Retrieves the allowed list of gasless transaction targets
    function getPricerTxToAddrs() external view returns (address[] memory);

    /// @notice See if the sender address is allowed for gasless transactions
    function isPricerTxFrom(address addr) external view returns (bool);

    /// @notice See if the target address is allowed for gasless transactions
    function isPricerTxTo(address addr) external view returns (bool);
}
