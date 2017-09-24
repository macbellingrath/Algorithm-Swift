//: [Previous](@previous)

import Foundation

/*
 14. Longest Common Prefix
 Write a function to find the longest common prefix string amongst an array of strings.
 */
class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.isEmpty {
            return ""
        }

        var prefix = strs[0]

        for i in 1..<strs.count {
            while let index = strs[i].range(of: prefix)?.lowerBound, index != strs[i].startIndex {
                prefix = String(prefix[..<prefix.endIndex])
                if prefix.isEmpty { return "" }
            }
        }


        return String(prefix)
    }
}

let s = Solution()
print(s.longestCommonPrefix(["car", "cars", "caring"]))
print(s.longestCommonPrefix(["a","b" ]))
//: [Next](@next)
