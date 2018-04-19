//: [Previous](@previous)

import Foundation

/*
 You're given strings J representing the types of stones that are jewels, and S representing the stones you have.  Each character in S is a type of stone you have.  You want to know how many of the stones you have are also jewels.

 The letters in J are guaranteed distinct, and all characters in J and S are letters. Letters are case sensitive, so "a" is considered a different type of stone from "A".
 */

class Solution {
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        let jewelSet = Set(J.characters)
        var n = 0

        for c in S where jewelSet.contains(c) {
            n += 1
        }

        return n
    }
}

let s = Solution()

// test cases
let input = (j: "aA", s: "aAAbbbb")
s.numJewelsInStones(input.j, input.s)

//: [Next](@next)
