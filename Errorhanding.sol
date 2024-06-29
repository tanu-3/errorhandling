// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GameWinner {
    address public owner;
    address public winner;
    bool public gameEnded;

    mapping(address => uint256) public scores;
    address[] public players;

    constructor() {
        owner = msg.sender;
        gameEnded = false;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function.");
        _;
    }

    modifier gameNotEnded() {
        require(!gameEnded, "The game has already ended.");
        _;
    }

    function addPlayer(address player) public onlyOwner gameNotEnded {
        players.push(player);
        scores[player] = 0;
    }

    function updateScore(address player, uint256 score) public onlyOwner gameNotEnded {
        require(score > scores[player], "New score must be higher than the current score.");
        scores[player] = score;
    }

    function endGame() public onlyOwner gameNotEnded {
        uint256 highestScore = 0;
        address highestScorer = address(0);

        for (uint256 i = 0; i < players.length; i++) {
            if (scores[players[i]] > highestScore) {
                highestScore = scores[players[i]];
                highestScorer = players[i];
            }
        }

        // Ensure that there is at least one player
        assert(players.length > 0);

        // If no highest scorer is found, revert the transaction
        if (highestScorer == address(0)) {
            revert("No highest scorer found. Game cannot end.");
        }

        winner = highestScorer;
        gameEnded = true;
    }

    function getWinner() public view returns (address) {
        require(gameEnded, "The game has not ended yet.");
        return winner;
    }
}
