//: [Previous](@previous)

import Foundation
/*
 The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

 P   A   H   N
 A P L S I I G
 Y   I   R
 And then read line by line: "PAHNAPLSIIGYIR"

 Write the code that will take a string and make this conversion given a number of rows:

 string convert(string s, int numRows);
 Example 1:

 Input: s = "PAYPALISHIRING", numRows = 3
 Output: "PAHNAPLSIIGYIR"
 Example 2:

 Input: s = "PAYPALISHIRING", numRows = 4
 Output: "PINALSIGYAHRPI"
 Explanation:

 P     I    N
 A   L S  I G
 Y A   H R
 P     I
*/

class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        var answer: [[Character]] = Array(repeating: [Character](), count: numRows)
        var characters = s.characters

        let length = characters.count
        var i = 0

        while i < length {
            // vertically down
            for index in 0..<numRows where i < length {
                answer[index].append(characters[i])
                i += 1
            }

            // obliquely up
            for index in stride(from: numRows - 2, through: 1, by: -1) where i < length {
                answer[index].append(characters[i])
                i += 1
            }
        }

        for index in 1..<answer.count {
            answer[0].append(answer[index])
        }

        return String(answer[0])
    }

}

// Test cases
/*
 Input: s = "PAYPALISHIRING", numRows = 3
 Output: "PAHNAPLSIIGYIR"

 */
let s = Solution()


//: [Next](@next)
