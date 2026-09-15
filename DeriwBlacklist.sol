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

    /// @dev Requires DeriwOS 6. One type per address, not a bitmask: 1 = ban all (legacy
    /// enforcement), 2 = ERC20/USDT transfer ban (stored only, no DeriwOS
    /// enforcement). Other values revert. Existing add methods use flag 1.
    /// Legacy list/membership getters include every type; rejection requires flag 1.

    /// @notice Filter the first 65536 direction-list entries by their stored ban flag.
    function getBlacklistTxFromWithFlag(uint64 flag) external view returns (address[] memory);

    /// @notice Check the address for the requested ban type.
    function isBlacklistTxFromWithFlag(address addr, uint64 flag) external view returns (bool);

    /// @notice Set the ban type, replacing the previous type in both direction lists.
    function addBlacklistTxFromWithFlag(address addr, uint64 flag) external;

    /// @notice Remove this direction for the requested type; reverts if absent.
    /// @dev Quarantined owners must use the legacy removal method for recovery.
    function removeBlacklistTxFromWithFlag(address addr, uint64 flag) external;

    /// @notice Filter the first 65536 direction-list entries by their stored ban flag.
    function getBlacklistTxToWithFlag(uint64 flag) external view returns (address[] memory);

    /// @notice Check the address for the requested ban type.
    function isBlacklistTxToWithFlag(address addr, uint64 flag) external view returns (bool);

    /// @notice Set the ban type, replacing the previous type in both direction lists.
    function addBlacklistTxToWithFlag(address addr, uint64 flag) external;

    /// @notice Remove this direction for the requested type; reverts if absent.
    /// @dev Quarantined owners must use the legacy removal method for recovery.
    function removeBlacklistTxToWithFlag(address addr, uint64 flag) external;

    /// @notice Return the address's ban type: 0 = unlisted, 1 = all, 2 = ERC20/USDT transfer.
    function getBlacklistBanFlag(address addr) external view returns (uint64);
}
