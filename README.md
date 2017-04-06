# Bot Saves Princess
This is a solution for the HackerRank problem:

https://www.hackerrank.com/challenges/saveprincess


## Input format

The first line contains an odd integer N (3 <= N < 100) denoting the size of the grid. This is followed by an NxN grid. Each cell is denoted by '-' (ascii value: 45). The bot position is denoted by 'm' and the princess position is denoted by 'p'.

Grid is indexed using Matrix Convention

## Output format

Print out the moves you will take to rescue the princess in one go. The moves must be separated by '\n', a newline. The valid moves are LEFT or RIGHT or UP or DOWN.

### Sample input
```
3
---
-m-
p--
```

### Sample output
```
DOWN
LEFT
```

# Bot Saves Princess - 2
This is a solution for the HackerRank problem:

https://www.hackerrank.com/challenges/saveprincess2

## Input Format
The first line of the input is N (<100), the size of the board (NxN). The second line of the input contains two space separated integers, which is the position of the bot.

Grid is indexed using Matrix Convention

The position of the princess is indicated by the character 'p' and the position of the bot is indicated by the character 'm' and each cell is denoted by '-' (ascii value: 45).

## Output Format
Output only the next move you take to rescue the princess. Valid moves are LEFT, RIGHT, UP or DOWN

### Sample Input
```
5
2 3
-----
-----
p--m-
-----
-----
```

## Sample Output
```
LEFT
```

## Resultant State
```
-----
-----
p-m--
-----
-----
```
