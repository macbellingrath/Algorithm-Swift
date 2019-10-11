//: [Previous](@previous)

import Foundation

/*
 680. Valid Palindrome II

 Given a non-empty string s, you may delete at most one character. Judge whether you can make it a palindrome.

 Example 1:

 Input: "aba"
 Output: True
 Example 2:

 Input: "abca"
 Output: True
 Explanation: You could delete the character 'c'.
 Note:

 The string will only contain lowercase characters a-z. The maximum length of the string is 50000.
 */

class Solution {
    func validPalindrome(_ s: String) -> Bool {
        func isPalindromic(_ s: String, l: String.Index, r: String.Index) -> Bool {
            var l = l
            var r = r
            while l < r {
                if s[l] != s[r] {
                    return false
                }
                l = s.index(after: l)
                r = s.index(before: r)
            }
            return true
        }

        var i = s.startIndex
        var j = s.endIndex


        while i < j {
            if s[i] != s[j] {
                return isPalindromic(s, l: s.index(after: i), r: j) || isPalindromic(s, l: i, r: s.index(before: j))
            }
            i = s.index(after: i)
            j = s.index(before: j)
        }

        return true
    }
}
let solution = Solution()

let exOne = "aba"
let exTwo = "abca"
let exThree = "racecazszr"

solution.validPalindrome(exOne)
solution.validPalindrome(exTwo)
solution.validPalindrome(exThree)


//: [Next](@next)
