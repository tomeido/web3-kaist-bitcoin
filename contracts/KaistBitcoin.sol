//SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity >=0.8.0;

import "hardhat/console.sol";

import {ECDSA} from "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";

contract KaistBitcoin {
    struct KaistBitcoinTx {
        address from;
        address to;
        uint256 amount;
        uint256 fee;
        bytes signature;
    }

    function validateTx(KaistBitcoinTx memory _tx) public pure returns (bool) {
        // verify signature
        bytes32 txHash = _txHash(_tx);
        bytes32 hashToSigh = hash("prefx" + txHash);
    }

    function _txHash(
        KaistBitcoinTx memory _tx
    ) internal pure returns (bytes32) {
        // return the hash of the transaction
        return keccak256(abi.encodePacked(
            _tx.from, _tx.to, _tx.amount, _tx.fee
        ));
    }
}
