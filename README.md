# Error Handling

The basic purpose is to make code more accurate by using error handling statements that is require, revert and assert statements.

## Description

We created a smart contract name GameWinner. In this,it is basically for calculation of adding player , updating score ,getting score and end the game and also check who is winner where the need of error handling is important alot. I used require,revert and assert to handle the problems occuring in solving these things.

## Getting Started

### Installing

1. Install errorhandling.sol file of mine.
2. Run on Remix.
3. compile
4. deloy.
5. test all conditions.

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., HelloWorld.sol). Copy and paste the following code into the file:
```javascript
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
      
```
## Authors

TANU PAL
@Tanu


## License

This project is licensed under the Meta License.
