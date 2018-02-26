//: [Previous](@previous)

import Foundation

/*
 Given an array and a value, remove all instances of that value in-place and return the new length.

 Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.

 The order of elements can be changed. It doesn't matter what you leave beyond the new length.
 */

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var i = 0

        while i < nums.count {
            if nums[i] == val {
                nums.remove(at: i)
                continue
            }

             i += 1
        }

        return i
    }
}

let s = Solution()

var testCase1 = [0,0,0,0,1,1,2]
s.removeElement(&testCase1, 0)


var testCase2 = [9,19]
s.removeElement(&testCase2, 9)


var testCase3: [Int] = []
s.removeElement(&testCase3, 0)


//: [Next](@next)
