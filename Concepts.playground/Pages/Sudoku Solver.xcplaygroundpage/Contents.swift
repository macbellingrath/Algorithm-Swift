//: [Previous](@previous)

import Foundation


class Solution {
    typealias Board = [[Character]]

    struct Constants {
        static let undefined: Character = "."
    }

    func findUnassigned(row: inout Int,
                        column: inout Int,
                        board: Board) -> Bool {
        while row < board.count {
            column = 0
            while column < board.count {
                if board[row][column] == Constants.undefined {
                    return true
                }
                column += 1
            }
            row += 1
        }
        return false
    }

    func usedInRow(num: Character,
                   row: Int,
                   board: Board) -> Bool {
        for column in board[row] {
            if column == num {
                return true
            }
        }
        return false
    }

    func usedInColumn(num: Character,
                      column: Int,
                      board: Board) -> Bool {
        for row in board {
            if row[column] == num {
                return true
            }
        }
        return false
    }

    func usedInBox(board: Board,
                   num: Character,
                   boxRowStart: Int,
                   boxColStart: Int) -> Bool {
        for row in 0..<3  {
            for column in 0..<3 {
                if board[row + boxRowStart][column + boxColStart] == num {
                    return true
                }
            }
        }
        return false
    }
    /// Returns boolean indicating if it is safe to place a candidate number in the cooresponding row and column
    ///
    /// - Parameters:
    ///   - num: candidate number, 1-9
    ///   - board: the 2-d vector containing the spaces 1-9 and undefined
    ///   - row: the row index
    ///   - col: the column index
    /// - Returns: true if it is safe to place this candidate number, otherwise false
    func isSafe(num: Character,
                board: Board,
                row: Int,
                col: Int) -> Bool {
        return !usedInRow(num: num, row: row, board: board) &&
            !usedInColumn(num: num, column: col, board: board) &&
            !usedInBox(board: board, num: num, boxRowStart: row - row % 3, boxColStart: col - col % 3) &&
            board[row][col] == Constants.undefined
    }

    private func solve(board: inout Board) -> Bool {
        var row = 0
        var col = 0


        if !findUnassigned(row: &row, column: &col, board: board) {
            return true
        }

        for num in (1...9).map({ Character(String($0)) }){
            if isSafe(num: num, board: board, row: row, col: col) {
                board[row][col] = num

                if solve(board: &board) {
                    return true
                }
                board[row][col] = Constants.undefined
            }
        }
        return false
    }

    func solveSudoku(_ board: inout [[Character]]) {
        solve(board: &board)
    }
}

var board: Solution.Board = [["5","3",".", ".","7",".", ".",".","."],
                             ["6",".",".", "1","9","5", ".",".","."],
                             [".","9","8", ".",".",".", ".","6","."],

                             ["8",".",".", ".","6",".", ".",".","3"],
                             ["4",".",".","8",".","3",".",".","1"],
                             ["7",".",".",".","2",".",".",".","6"],
                             [".","6",".",".",".",".","2","8","."],
                             [".",".",".","4","1","9",".",".","5"],
                             [".",".",".",".","8",".",".","7","9"]]
Solution().solveSudoku(&board)
print(board)
//: [Next](@next)
