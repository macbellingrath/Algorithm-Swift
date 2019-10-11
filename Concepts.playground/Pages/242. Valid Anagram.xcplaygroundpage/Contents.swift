//: [Previous](@previous)

import Foundation

/*
 242. Valid Anagram
 Given two strings s and t , write a function to determine if t is an anagram of s.

 Example 1:

 Input: s = "anagram", t = "nagaram"
 Output: true
 Example 2:

 Input: s = "rat", t = "car"
 Output: false
 Note:
 You may assume the string contains only lowercase alphabets.

 Follow up:
 What if the inputs contain unicode characters? How would you adapt your solution to such case?
 */
class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        let offset = Character("a").asciiValue!

        var counts = Array(repeating: 0, count: 26)
        for char in s.utf8 {
            let i = Int(char - offset)
            counts[i] += 1
        }

        for char in t.utf8 {
            let i = Int(char - offset)
            if counts[i] == 0 { return false }

            counts[i] -= 1
        }

        for count in counts {
            if count != 0 {
                return false
            }
        }

        return true
    }
}

//: [Next](@next)
