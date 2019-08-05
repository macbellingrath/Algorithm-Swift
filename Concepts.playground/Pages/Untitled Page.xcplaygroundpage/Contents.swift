//: [Previous](@previous)

import Foundation

/* # 55. Jump Game
 Given an array of non-negative integers, you are initially positioned at the first index of the array.

 Each element in the array represents your maximum jump length at that position.

 Determine if you are able to reach the last index.

 Example 1:

 Input: [2,3,1,1,4]
 Output: true
 Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.
 Example 2:

 Input: [3,2,1,0,4]
 Output: false
 Explanation: You will always arrive at index 3 no matter what. Its maximum
 jump length is 0, which makes it impossible to reach the last index.

 [1,0,1]
 [1,2,1]
 */
class Solution {
    private func helper(index: Int, nums: [Int]) -> Bool {
        if nums[index] >= nums.endIndex - 1 {
            return true
        } else if nums[index] == 0 {
            return false
        }

        for jump in 1...nums[index] {
            if helper(index: index + jump, nums: nums) {
                return true
            }
        }
        return false
    }

    func canJump(_ nums: [Int]) -> Bool {
        return helper(index: 0, nums: nums)
    }

}



let testOne = [2,3,1,1,4]
let testTwo = [3,2,1,0,4]

// 0 - 3 - x
// 0 - 2 - 3 - x
// 0 - 1 - 2 - 3 - x
// 0 - 1 - 3 - x
let solution = Solution()
//solution.canJump(testOne) == true
solution.canJump(testOne) == false

//: [Next](@next)
