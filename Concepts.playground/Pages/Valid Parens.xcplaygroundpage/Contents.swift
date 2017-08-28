//: [Previous](@previous)

import Foundation

/*

 Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

 The brackets must close in the correct order, "()" and "()[]{}" are all valid but "(]" and "([)]" are not.
 */

class Solution {
    func isValid(_ s: String) -> Bool {
        if s.characters.count < 2 { return false }
        var complements: [Character] = []

        for c in s.characters {
            if c == "(" {
                complements.insert(")", at: 0)
            } else if c == "{" {
                complements.insert("}", at: 0)
            } else if c == "[" {
                complements.insert("]", at: 0)
            } else if complements.isEmpty || complements.removeFirst() != c {
                return false
            }
        }

        return complements.isEmpty
    }
}


// test
let s = Solution()
s.isValid("([]])")

// time complexity 
// O(n) - linear

// space complex
// linear also

//: [Next](@next)
