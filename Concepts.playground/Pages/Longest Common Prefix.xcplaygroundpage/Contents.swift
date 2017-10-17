//: [Previous](@previous)

import Foundation

/*
 14. Longest Common Prefix
 Write a function to find the longest common prefix string amongst an array of strings.
 */
class Solution {

    /// find longest common prefix among array of string
    ///
    ///   Best case - O(1) (1 item) - Worst case - O(n^2) - Average - O(n)?
    /// - Parameter strs: array of strings
    /// - Returns: lcp
    func longestCommonPrefix(_ strs: [String]) -> String {
        // if count == 0
        if strs.isEmpty {
            return ""
        }

        // if count == 1
        if strs.count < 2 {
            return strs[0]
        }

        var i = strs[0].startIndex

        // O(n)
        for string in strs[1..<strs.count] {

            // O(n)
            while i < strs[0].endIndex, i < string.endIndex, strs[0][i] == string[i] {
                i = strs[0].index(after: i)
            }
        }

        return String(strs[0][strs[0].startIndex..<i])
    }
}

let s = Solution()


print(s.longestCommonPrefix(["car", "cars", "caring"]))

//: [Next](@next)
