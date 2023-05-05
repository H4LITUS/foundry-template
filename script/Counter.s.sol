// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Counter.sol";

contract CounterScript is Script {
    address internal deployer;

    Counter internal counter;

    function setUp() public {
        vm.createSelectFork({ urlOrAlias: "localhost" });
        string memory mnemonic = vm.envString("MNEMONIC_LOCALHOST");
        (deployer,) = deriveRememberKey(mnemonic, 0);
    }

    function run() public {
        vm.startBroadcast(deployer);
        counter = new Counter();
        vm.stopBroadcast();
    }
}
