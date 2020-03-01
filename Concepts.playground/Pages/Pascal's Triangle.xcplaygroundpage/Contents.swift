//: [Previous](@previous)

/**
 118. Pascal's Triangle
 Given a non-negative integer numRows, generate the first numRows of Pascal's triangle.
 */
class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var res: [[Int]] = []

        for i in 0..<numRows {
            var row: [Int] = []
            for j in 0..<(i + 1) {
                if j == 0 || j == i {
                    row.append(1)
                } else {
                    row.append(
                        res[i - 1][j - 1] + res[i - 1][j]
                    )
                }
            }
            res.append(row)
        }

        return res
    }

}

//: [Next](@next)
