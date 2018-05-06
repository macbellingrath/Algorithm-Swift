//: [Previous](@previous)

import Foundation
/*
Given a string containing just the characters '(' and ')', find the length of the longest valid (well-formed) parentheses substring.
 */

class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        var left = 0
        var right = 0
        var longestValid = 0

        for c in s {
            if c == "(" {
                left += 1
            } else {
                right += 1
            }

            if left == right {
                longestValid = max(longestValid, left + right)
            } else if right > left {
                left = 0
                right = 0
            }
        }

        left = 0
        right = 0

        for c in s.reversed() {
            if c == "(" {
                left += 1
            } else {
                right += 1
            }

            if left == right {
                longestValid = max(longestValid, left + right)
            } else if left > right {
                left = 0
                right = 0
            }
        }

        return longestValid
    }
}

let s = Solution()
s.longestValidParentheses("()(()()")
//: [Next](@next)
