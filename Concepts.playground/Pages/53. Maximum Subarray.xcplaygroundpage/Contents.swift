//: [Previous](@previous)

import Foundation

/*
 Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

 Input: [-2,1,-3,4,-1,2,1,-5,4],
 Output: 6
 Explanation: [4,-1,2,1] has the largest sum = 6.
 */

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return .min }

        var dp = [nums[0]]
        var i = 1
        var res = nums[0]

        while i < nums.count {
          dp.append(max(dp[i - 1] + nums[i], nums[i]))
          res = max(res, dp[i])
          i += 1
        }

        return res
    }
}



//: [Next](@next)
