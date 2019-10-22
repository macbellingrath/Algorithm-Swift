//: [Previous](@previous)

import Foundation
/**
 387. First Unique Character in a String
 Given a string, find the first non-repeating character in it and return it's index. If it doesn't exist, return -1.

 Examples:

 s = "leetcode"
 return 0.

 s = "loveleetcode",
 return 2.
 Note: You may assume the string contain only lowercase letters.
 */
class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var charCounts: [Character: Int] = [:]
        for c in s {
            charCounts[c] = (charCounts[c] ?? 0) + 1
        }
        var i = 0
        for c in s {
            if charCounts[c] == 1 {
                return i
            }
            i += 1
        }
        return -1
    }
}

//: [Next](@next)
