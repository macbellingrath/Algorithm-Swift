//: [Previous](@previous)

import Foundation

/*
 Given an array nums of n integers and an integer target, are there elements a, b, c, and d in nums such that a + b + c + d = target? Find all unique quadruplets in the array which gives the sum of target.

 Note:

 The solution set must not contain duplicate quadruplets.
*/

class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        if nums.count < 4 { return [] }
        let sorted = nums.sorted()

        var answer = [[Int]]()
        var map = [Int: [Int]] = [:]

        for num in sorted {
            
        }

        return answer
    }
}
// Test
let solution = Solution()

let nums = [1, 0, -1, 0, -2, 2]
let target = 0

solution.fourSum(nums, target) == [
    [-1,  0, 0, 1],
    [-2, -1, 1, 2],
    [-2,  0, 0, 2]
]

//: [Next](@next)
