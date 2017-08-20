//: [Previous](@previous)

import Foundation

/*:
 Given a 2D matrix of 0's and 1's, where the 1's make up a rectangle, find the coordinates of the top-left corner of the rectangle and the rectangle's width and height.
 */


class Solution {

    func findRectangle(_
        matrix: [[Int]]) -> (origin: (Int, Int), width: Int, height: Int)? {
        if matrix.isEmpty {
            return nil
        }

        for (i, row) in matrix.enumerated() {
            for (j, column) in row.enumerated() {
                if column != 1 {
                    continue
                }

                let origin = (i, j)
                var x = j
                var width = 0
                var height = 0

                while x < matrix.count && row[x] == 1 {
                    width += 1

                    var y = j

                    while y < matrix[i].count &&  matrix[i][y] == 1 {
                        height += 1
                        y += 1
                    }

                    x += 1
                }

                return (origin, width, height)
            }
        }

        return nil
    }
}

let matrix = [
    [0, 0 , 1 , 1, 0 ],
    [0, 0 , 1 , 1, 0 ],
    [0, 0 , 1 , 1, 0 ],
    [0, 0 , 1 , 1, 0 ],
]

let s = Solution()
s.findRectangle(matrix)

//: [Next](@next)
