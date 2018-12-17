//: [Previous](@previous)

// 36. Valid Sudoku
// Determine if a 9x9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:
//
// Each row must contain the digits 1-9 without repetition.
// Each column must contain the digits 1-9 without repetition.
// Each of the 9 3x3 sub-boxes of the grid must contain the digits 1-9 without repetition.
//
// Note:
//
// A Sudoku board (partially filled) could be valid but is not necessarily solvable.
// Only the filled cells need to be validated according to the mentioned rules.
// The given board contain only digits 1-9 and the character '.'.
// The given board size is always 9x9.
class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var set = Set<String>()
        for i in 0..<9 {
            for j in 0..<9 {
                if board[i][j] != "." {
                    let composite = "(\(board[i][j]))"
                    if !set.insert(composite + "\(i)").inserted ||
                       !set.insert("\(j)" + composite).inserted ||
                        !set.insert("\(i / 3)" + composite + "\(j / 3)").inserted {
                        return false
                    }
                }
            }
        }
        return true
    }
}

let valid:[[Character]] = [
 
    ["5","3",".", ".","7",".", ".",".","."],
    ["6",".",".", "1","9","5", ".",".","."],
    [".","9","8", ".",".",".", ".","6","."],
   
    ["8",".",".", ".","6",".", ".",".","3"],
    ["4",".",".", "8",".","3", ".",".","1"],
    ["7",".",".", ".","2",".", ".",".","6"],
   
    [".","6",".", ".",".",".", "2","8","."],
    [".",".",".", "4","1","9", ".",".","5"],
    [".",".",".", ".","8",".", ".","7","9"]

]

let invalid:[[Character]] = [
    ["8","3",".", ".","7",".", ".",".","."],
    ["6",".",".", "1","9","5", ".",".","."],
    [".","9","8", ".",".",".", ".","6","."],
   
    ["8",".",".", ".","6",".", ".",".","3"],
    ["4",".",".", "8",".","3", ".",".","1"],
    ["7",".",".", ".","2",".", ".",".","6"],
    
    [".","6",".", ".",".",".", "2","8","."],
    [".",".",".", "4","1","9", ".",".","5"],
    [".",".",".", ".","8",".", ".","7","9"]
]

let solution = Solution()
solution.isValidSudoku(valid)
solution.isValidSudoku(invalid)

//: [Next](@next)
