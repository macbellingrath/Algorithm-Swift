//: [Previous](@previous)

import Foundation
/*
 Given an array S of n integers, find three integers in S such that the sum is closest to a given number, target. Return the sum of the three integers. You may assume that each input would have exactly one solution.
 */
class Solution {
    func solve(_ nums: [Int], target: Int) -> Int {
        guard nums.count > 2 else {
            return 0
        }

        // [ 1, 2, 6, 10, 20] target: 3

        // memoize distance from target
        var map: [Int: Int] = [:]

        for num in nums {
            map[abs(target - num)] = num
        }

        let firstKeys = map.keys.sorted()[0..<3]
        var sum = 0

        for key in firstKeys {
            sum += map[key]!
        }

        return sum
    }

    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 2 else {
            return 0
        }

        let nums = nums.sorted()
        var answer = nums[0] + nums[1] + nums[nums.count - 1]

        for i in 0..<nums.count {
            var start = i + 1
            var end = nums.count - 1
            while start < end {
                let sum = nums[i] + nums[start] + nums[end]
                if sum > target {
                    end -= 1
                } else {
                    start += 1
                }

                if abs(sum - target) < abs(answer - target) {
                    answer = sum
                }
            }

        }

            return answer
    }
}

let s = Solution()
s.solve([0,11,-2,4], target: 9)
//: [Next](@next)
