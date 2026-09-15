// Copyright 2021-2022, Offchain Labs, Inc.
// For license information, see https://github.com/OffchainLabs/nitro-contracts/blob/main/LICENSE
// SPDX-License-Identifier: BUSL-1.1

pragma solidity >=0.4.21 <0.9.0;

/// @title Provides non-owners with info about the blacklist configuration.
/// @notice Precompiled contract that exists in Deriw chain at 0x00000000000000000000000000000000000007EB.
interface DeriwBlacklistPublic {
    /// @notice See if the user is a blacklist owner
    function isBlacklistOwner(address addr) external view returns (bool);

    /// @notice Rectify the list of blacklist owners
    function rectifyBlacklistOwner(address ownerToRectify) external;

    /// @notice Retrieves the list of blacklist owners
    function getAllBlacklistOwners() external view returns (address[] memory);

    /// @notice Retrieves the blacklist transaction sender list
    function getBlacklistTxFrom() external view returns (address[] memory);

    /// @notice Retrieves the blacklist transaction target list
    function getBlacklistTxTo() external view returns (address[] memory);

    /// @notice See if the sender address is blacklisted
    function isBlacklistTxFrom(address addr) external view returns (bool);

    /// @notice See if the target address is blacklisted
    function isBlacklistTxTo(address addr) external view returns (bool);

    /// @dev Requires DeriwOS 6. One type per address, not a bitmask: 1 = ban all (legacy
    /// enforcement), 2 = ERC20/USDT transfer ban (stored only, no DeriwOS
    /// enforcement). Other values revert. Existing add methods use flag 1.
    /// Legacy list/membership getters include every type; rejection requires flag 1.

    /// @notice Filter the first 65536 direction-list entries by their stored ban flag.
    function getBlacklistTxFromWithFlag(uint64 flag) external view returns (address[] memory);

    /// @notice Check the address for the requested ban type.
    function isBlacklistTxFromWithFlag(address addr, uint64 flag) external view returns (bool);

    /// @notice Filter the first 65536 direction-list entries by their stored ban flag.
    function getBlacklistTxToWithFlag(uint64 flag) external view returns (address[] memory);

    /// @notice Check the address for the requested ban type.
    function isBlacklistTxToWithFlag(address addr, uint64 flag) external view returns (bool);

    /// @notice Return the address's ban type: 0 = unlisted, 1 = all, 2 = ERC20/USDT transfer.
    function getBlacklistBanFlag(address addr) external view returns (uint64);
}
