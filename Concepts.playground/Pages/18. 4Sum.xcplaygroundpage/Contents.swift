//: [Previous](@previous)

import Foundation

class Solution {
    /*
     Given an array S of n integers, are there elements a, b, c, and d in S such that a + b + c + d = target? Find all unique quadruplets in the array which gives the sum of target.
     */
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var answer: [[Int]] = []

        if nums.count < 4 {
            return answer
        }

        // sort input
        let sorted = nums.sorted()

        var i = 0
        var j = 1
        var k = 2
        var l = 3

        while l < sorted.count {

        }


        return answer
    }
}
// [0,1,2,3,4,5,6,7] taget: 9


//: [Next](@next)
