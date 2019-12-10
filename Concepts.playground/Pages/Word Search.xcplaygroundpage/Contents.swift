//: [Previous](@previous)

import Foundation
/*
79. Word Search
Medium

Given a 2D board and a word, find if the word exists in the grid.

The word can be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once.

Example:

board =
[
  ["A","B","C","E"],
  ["S","F","C","S"],
  ["A","D","E","E"]
]

Given word = "ABCCED", return true.
Given word = "SEE", return true.
Given word = "ABCB", return false.
*/
class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var board = board
        for row in 0..<board.count {
            for col in 0..<board[row].count {
                if dfs(board: &board, word: word, row: row, col: col) {
                    return true
                }
            }
        }
        return false
    }

    private func dfs(board: inout [[Character]], word: String, row: Int, col: Int) -> Bool {
        guard !word.isEmpty else {
            return true
        }

        guard
            0..<board.count ~= row,
            0..<board[0].count ~= col,
            board[row][col] == word[word.startIndex] else {
            return false
        }

        let temp = board[row][col]
        board[row][col] = "*" // mark visited

        let strIndex = word.index(after: word.startIndex)
        let subStr: String = strIndex >= word.endIndex ? "" : String(word[strIndex...])

        let res = dfs(board: &board, word: subStr, row: row + 1, col: col) ||
                  dfs(board: &board, word: subStr, row: row - 1, col: col) ||
                  dfs(board: &board, word: subStr, row: row, col: col - 1) ||
                  dfs(board: &board, word: subStr, row: row, col: col + 1)

        board[row][col] = temp
        return res
    }

}

let s = Solution()
let board: [[Character]] = [
  ["A","B","C","E"],
  ["S","F","C","S"],
  ["A","D","E","E"]
]

let testOne = "ABCCED"
let testTwo = "SEE"
let testThree = "ABCB"
s.exist(board, testOne) == true
s.exist(board, testTwo) == true
s.exist(board, testThree) == false

//: [Next](@next)
