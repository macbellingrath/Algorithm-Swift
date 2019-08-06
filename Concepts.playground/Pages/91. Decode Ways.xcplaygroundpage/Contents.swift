//: [Previous](@previous)

import Foundation

/*
 91. Decode Ways
 A message containing letters from A-Z is being encoded to numbers using the following mapping:

 'A' -> 1
 'B' -> 2
 ...
 'Z' -> 26
 Given a non-empty string containing only digits, determine the total number of ways to decode it.

 Example 1:

 Input: "12"
 Output: 2
 Explanation: It could be decoded as "AB" (1 2) or "L" (12).
 Example 2:

 Input: "226"
 Output: 3
 Explanation: It could be decoded as "BZ" (2 26), "VF" (22 6), or "BBF" (2 2 6).
 */

class Solution {
    func numDecodings(_ s: String) -> Int {
        let converted = Array(s.compactMap({
            Int(String($0))
        }))

        guard
            converted.count == s.count else {
            return 0
        }

        var res = 0


        return 0
    }
}


let solution = Solution()
let example1 = "12"
solution.numDecodings(example1) == 2

let example2 = "226"
/*
 226
 2 26
 22 6
 */
solution.numDecodings(example2) == 3
let example3 = "2266"
/*
 2 2 6 6
 22 6 6
 2 26 6

 */
//: [Next](@next)
