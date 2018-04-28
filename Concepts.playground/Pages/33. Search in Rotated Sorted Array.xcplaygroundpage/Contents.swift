//: [Previous](@previous)

import Foundation

/*
 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

 (i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).

 You are given a target value to search. If found in the array return its index, otherwise return -1.

 You may assume no duplicate exists in the array.

 Your algorithm's runtime complexity must be in the order of O(log n).
 */

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        // check empty
        if nums.isEmpty { return -1 }

        // check if count == 1
        if nums.count == 1 {
            return nums[0] == target ? 0 : -1
        }

        // get middle
        let midIndex = nums.count / 2

        // check left and right
        let median = nums[midIndex]

        if median == target {
            return midIndex
        } else {

        }

        let leftOfMedian = nums[midIndex - 1]
        let rightOfMedian = nums[midIndex + 1]


        return -1
    }
}

// Test case
let solution = Solution()

let nums = [4,5,6,7,0,1,2]
let target = 0

print(
    solution.search(nums, target) == 4
)
//: [Next](@next)
