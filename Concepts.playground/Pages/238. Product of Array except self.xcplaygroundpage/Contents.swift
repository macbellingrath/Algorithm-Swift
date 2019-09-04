//: [Previous](@previous)

import Foundation

/*
Given an array nums of n integers where n > 1,  return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].

Example:

Input:  [1,2,3,4]
Output: [24,12,8,6]

 Important: without division and in O(n) time.
*/

class Solution {

    func productExceptSelf(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else { return nums }

        var res = [Int](repeating: 0, count: nums.count)
        res[0] = 1

        for i in 1..<nums.count {
            res[i] = res[i - 1] * nums[i - 1]
        }

        var right = 1
        for i in stride(from: nums.count - 1, through: 0, by: -1) {
            res[i] *= right
            right *= nums[i]
        }

        return res
    }
}
Solution().productExceptSelf([1,2,3,4])

//: [Next](@next)
