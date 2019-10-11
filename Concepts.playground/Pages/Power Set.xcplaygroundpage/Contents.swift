//: [Previous](@previous)

import Foundation

/*
 78. Subsets
 Medium

 Given a set of distinct integers, nums, return all possible subsets (the power set).

 Note: The solution set must not contain duplicate subsets.

 Example:
 Input: nums = [1,2,3]
 Output:
 [
 [3],
 [1],
 [2],
 [1,2,3],
 [1,3],
 [2,3],
 [1,2],
 []
 ]
 */

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        if nums.isEmpty {
            return [nums]
        }

        let num = nums[0]
        let rest = Array(nums.suffix(from: min(1, nums.count)))
        let subsetsOfRest: [[Int]] = subsets(rest)
        let combined: [[Int]] = subsetsOfRest.map {
            var list = $0
            list.append(num)
            return list
        }

        return subsetsOfRest + combined
    }
}

//: [Next](@next)
