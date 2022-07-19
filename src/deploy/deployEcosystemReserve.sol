// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "forge-std/console.sol";
import { AaveEcosystemReserveV2 } from "../contracts/AaveEcosystemReserveV2.sol";
import { ProposalPayloadAaveEcosystemReserveV2 } from "../contracts/ProposalPayloadAaveEcosystemReserveV2.sol";

contract DeployEcosystemReserveProposal is Script {
    uint256 public constant PROPOSAL_ID = 0; // TODO: Add proposal Id of the LongExecutor proposal

    function run() public {
        vm.startBroadcast();

        AaveEcosystemReserveV2 aaveEcosystemReserveV2Impl = new AaveEcosystemReserveV2();
        console.log(
            "aaveEcosystemReserveImpl:",
            address(aaveEcosystemReserveV2Impl)
        );

        ProposalPayloadAaveEcosystemReserveV2 payload = new ProposalPayloadAaveEcosystemReserveV2(
                address(aaveEcosystemReserveV2Impl),
                PROPOSAL_ID
            );

        console.log("ProposalPayloadAaveEcosystemReserveV2:", address(payload));

        vm.stopBroadcast();
    }
}