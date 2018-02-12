//: [Previous](@previous)

import Foundation
/*
 Given a sorted array, remove the duplicates in-place such that each element appear only once and return the new length.

 Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.


 ex>
 Given nums = [1,1,2],

 Your function should return length = 2, with the first two elements of nums being 1 and 2 respectively.
 It doesn't matter what you leave beyond the new length.
*/


class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 1 else { return nums.count }

        var i = 0
        var j = 1

        while j < nums.count {
            while j < nums.count && nums[i] == nums[j] {
                nums.remove(at: j)
            }

            i += 1
            j += 1
        }

        return nums.count
    }
}

let s = Solution()

// test cases

var input = [1,1,1]
s.removeDuplicates(&input)
assert(input == [1])

var input2 = [1]
s.removeDuplicates(&input2)
assert(input2 == [1])

var input3: [Int] = []
s.removeDuplicates(&input3)
assert(input3 == [])

var input4 = [0,1,2,7,7,9]
s.removeDuplicates(&input4)
assert(input4 == [0,1,2,7,9])

var input5 = [1,2,2,2,3]
s.removeDuplicates(&input)
assert(input5 == [1,2,3])

//: [Next](@next)
