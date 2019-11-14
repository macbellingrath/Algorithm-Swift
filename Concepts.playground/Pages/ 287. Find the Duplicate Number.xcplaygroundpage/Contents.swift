//: [Previous](@previous)
/**
 287. Find the Duplicate Number
 Medium

 Given an array nums containing n + 1 integers where each integer is between 1 and n (inclusive), prove that at least one duplicate number must exist. Assume that there is only one duplicate number, find the duplicate one.

 Example 1:
 Input: [1,3,4,2,2]
 Output: 2

 Example 2:
 Input: [3,1,3,4,2]
 [1,2,3,3,4] => count == 5, n = 4, sum == 13 - answer == 3// 4 3 2 1 == 10, 13 - 10 == 3, 3 / 1 == 3
 [1,2,3,3,3] => count == 5, n = 3, sum == 12 - answer == 3 // 3 2 1 = 6, 12 - 6 == 6, 6 / 2 == 3
 [1,2,2,2,3] => count == 5, n = 3, sum == 10 - answer == 2 // 3 2 1 == 6, 10 - 6 == 4, 4 /2 == 2


 [1,4,4,2,4], 4 3 2 1 == 11, n == 4, sum 15, 15 - 11 == 4,

 - [1,2,3,4] sum 10,
- [1,2,3,4,5] sum 15,
 - [1,2,3,4,5,6] sum 21,

 - [3,2,2,2] sum 9,

 Output: 3
 Note:

 You must not modify the array (assume the array is read only).
 You must use only constant, O(1) extra space.
 Your runtime complexity should be less than O(n2).
 There is only one duplicate number in the array, but it could be repeated more than once.
 */
class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return -1 }

        var slow = nums[0]
        var fast = nums[nums[0]]
        while slow != fast {
            slow = nums[slow]
            fast = nums[nums[fast]]
        }

        fast = 0
        while fast != slow {
            slow = nums[slow]
            fast = nums[fast]
        }
        return slow
    }

}

let solution = Solution()
let example1 = [1,3,4,2,2]
let example2 = [3,1,3,4,2]
let example3 = [1,4,4,2,4]

print(solution.findDuplicate(example1) == 2)
print(solution.findDuplicate(example2) == 3)
print(solution.findDuplicate(example3) == 4)


//: [Next](@next)
