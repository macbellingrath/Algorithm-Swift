//: [Previous](@previous)

import Foundation

/*:
 Given an array of integers, return indices of the two numbers such that they add up to a specific target.

 You may assume that each input would have exactly one solution, and you may not use the same element twice.

 */


class Solution {
    // O(n^2) brute force
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        guard nums.count > 1 else {
            return []
        }

        var i = 0
        while i < nums.count {
            var j = i + 1
            while j < nums.count {
                if nums[i] + nums[j] == target {
                    return [i, j]
                }
                j += 1
            }
            i += 1
        }

        return []
    }
}


class BetterSolution {

    // Time complexity - O(n) 
    // single pass hash lookup
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map: [Int:Int] = [:]

        for i in 0..<nums.count {
            let n = nums[i]
            let complement = target - n

            print("complement: \(complement)")
            print("map: \(map)")
            if let value = map[complement] {
                return [value, i]
            }
            map[n] = i
        }
        return []
    }
}

// test case 1
let solution = Solution()
solution.twoSum([3,2,4], 6)


let better = BetterSolution()
better.twoSum([3,2,4], 6)
//: [Next](@next)
