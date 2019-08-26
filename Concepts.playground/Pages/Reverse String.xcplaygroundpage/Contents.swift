//: [Previous](@previous)

import Foundation

/*
 Write a function that reverses a string. The input string is given as an array of characters char[].

 Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.

 You may assume all the characters consist of printable ascii characters.
 */

class Solution {
    func reverseString(_ s: inout [Character]) {
        var i = 0
        while i < (s.count >> 1) {
            let j = (s.count - 1) - i
            s.swapAt(i, j)
            i += 1
        }
    }
}
let s = Solution()

var chars: [Character] = ["h", "e", "l", "l", "o"]
s.reverseString(&chars)
print(chars)
//: [Next](@next)
