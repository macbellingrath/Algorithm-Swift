//: [Previous](@previous)

import Foundation

/*
 169. Majority Element
 Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.

 You may assume that the array is non-empty and the majority element always exist in the array.

 Example 1:

 Input: [3,2,3]
 Output: 3
 Example 2:

 Input: [2,2,1,1,1,2,2]
 Output: 2
 */

class Solution {

    // attempt # 1
    /*
    func majorityElement(_ nums: [Int]) -> Int {
        var map: [Int: Int] = [:]
        let majority = nums.count / 2
        for num in nums {
            let count = (map[num] ?? 0) + 1
            map[num] = count
            if count >= majority {
                return num
            }
        }
        return -1
    }
    */

    // most popular algorithm
    func majorityElement(_ nums: [Int]) -> Int {
        var major = nums[0]
        var count = 1
        for num in nums[1...] {
            if count == 0 {
                count = 1
                major = num
            } else if num == major {
                count += 1
            } else {
                count -= 1
            }
        }
        return major
    }

}

//: [Next](@next)
