// Layout of Contract:
// version
// imports
// errors
// interfaces, libraries, contracts
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// view & pure functions


// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;


/**
 * @title Raffle Contract
 * @author Ashmit Singh
 * @notice This contract implements a simple raffle system.
 * @dev Implement chainlink VRFv2.5 for randomness.
 */


contract Raffle {   

    // Errors
    error NotEnoughETH();

    // State variables
    uint256 private immutable i_entryFee;
    uint256 private immutable i_interval;
    address payable[] private s_players;
    uint256 private lastTimeStamp;

    // Events
    event RaffleEnter(address indexed player);

    constructor(uint256 entryFee, uint256 interval){
        // @dev The duration of lottery in seconds
        i_entryFee = entryFee;
        i_interval = interval;
        lastTimeStamp = block.timestamp;
    }

    function enterRaffle() external payable {
        // require(msg.value >= i_entryFee, "Not enough ETH sent");  // Less gas efficient
        // require(msg.value >= i_entryFee, NotEnoughETH());   // More gas efficient

        if(msg.value < i_entryFee){   // Highest gas efficient
            revert NotEnoughETH();
        }

        s_players.push(payable(msg.sender));
        emit RaffleEnter(msg.sender);
    }

    function pickWinner() external {
        // Get Random Number
        // Use that number to pick a winner
        // Send the money to the winner
        // Be automatically called

        if(block.timestamp - lastTimeStamp < i_interval) {
            revert ();
        }

    }

    // getter function
    function getEntryFee() public view returns(uint256){
        return i_entryFee;
    }
}