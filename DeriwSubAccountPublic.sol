// Copyright 2021-2022, Offchain Labs, Inc.
// For license information, see https://github.com/OffchainLabs/nitro-contracts/blob/main/LICENSE
// SPDX-License-Identifier: BUSL-1.1

pragma solidity >=0.4.21 <0.9.0;

/// @title Provides users with public sub-account controls.
/// @notice Precompiled contract that exists in Deriw chain at 0x00000000000000000000000000000000000007E9.
interface DeriwSubAccountPublic {
    /// @notice Bind relationship between parent and sub-account.
    function grantAccountControl(bytes calldata signData, bytes calldata signature) external;

    /// @notice Revoke relationship between parent and sub-account.
    function revokeAccountControl(bytes calldata signData, bytes calldata signature) external;

    /// @notice Check which parent account controls a child address.
    function readAccountControl(address childAddress) external view returns (address);

    /// @notice Check which child account is granted by a parent address.
    function readAccountGranted(address parentAddress) external view returns (address);
}
