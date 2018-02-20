//: [Previous](@previous)
import Foundation

/*
 Jumps Game II
 Given an array of non-negative integers, you are initially positioned at the first index of the array.

 Each element in the array represents your maximum jump length at that position.

 Your goal is to reach the last index in the minimum number of jumps.

 For example:
 Given array A = [2,3,1,1,4]

 The minimum number of jumps to reach the last index is 2. (Jump 1 step from index 0 to 1, then 3 steps to the last index.)

 Note:
 You can assume that you can always reach the last index.
 */

class Solution {
    func jump(_ nums: [Int]) -> Int {
        var stepCount = 0
        var previousMax = 0
        var currentMax = 0

        for i in 0..<nums.count-1 {
            currentMax = max(currentMax, i + nums[i])

            if i == previousMax {
                stepCount += 1
                previousMax = currentMax
            }
        }
        return stepCount
    }

}

let s = Solution()

let input1 = [2,3,1,1,4]
s.jump(input1)

//: [Next](@next)
