//: [Previous](@previous)

import Foundation

class Solution {
    func solve(_ xs: inout [Int]) -> Int {

        var i = 0
        var j = xs.count - 1

        while i < j {
            while xs[i] != 0 {
                i += 1
            }

            while xs[j] == 0 {
                j -= 1
            }

            if i < j && xs[i] == 0 && xs[j] != 0 {
                swap(&xs[i], &xs[j])
                i += 1
                j -= 1
            }
        }

        return i
    }
}

var test1 = [1,0,0,0,2,0]

let s = Solution()

s.solve(&test1)
test1

//: [Next](@next)
/*
 PI - 1:
 i.) Reverse a Linked List?
 ii.) Divide 2 numbers without using "/" symbol and return remainder and the quotient?

 PI - 2:
 i.) Merge Intervals (Leet Code)

 OS:
 i.) Behavioural: Why FB? Followed by a coding challenge: Minimal run time scheduler(Leet Code)
 ii.) CC: Expression Evaluation
 iii.) CC: Find the K closest points to the origin in 2D plane, given an array containing N points. You can assume K is much smaller than N and N is very large.
 */