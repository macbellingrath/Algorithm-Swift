//: [Previous](@previous)

import Foundation

/*
 14. Longest Common Prefix
 Write a function to find the longest common prefix string amongst an array of strings.
 */
class Solution {
    func longestCommonPrefix_Horizontal(_ strs: [String]) -> String {
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

    func longestCommonPrefix_Vertical(_ strs: [String]) -> String {
        if strs.isEmpty { return "" }
        if strs.count == 1 { return strs[0] }

        var i = strs[0].startIndex

        for str in strs[1..<strs.count] {
            while i < strs[0].endIndex && i < str.endIndex && str[i] == strs[0][i] {
                i = strs[0].index(after: i)
            }
        }

        return String(strs[0][strs[0].startIndex..<i])
    }
}

let s = Solution()
//print(s.longestCommonPrefix_Horizontal(["car", "cars", "caring"]))
//print(s.longestCommonPrefix_Horizontal(["a","b" ]))

print(s.longestCommonPrefix_Vertical(["car", "cars", "caring"]))
print(s.longestCommonPrefix_Vertical(["aa", "a"]))
//: [Next](@next)
