//: [Previous](@previous)

/*
 136. Single Number
 Given a non-empty array of integers, every element appears twice except for one. Find that single one.
 
 Note:
 
 Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
 */
final class Solution {
    @inline(__always)
    func singleNumber(_ nums: [Int]) -> Int {
        return nums.reduce(into: 0) { (res, num) in
            res ^= num
        }
    }
}

let s = Solution()
s.singleNumber([1,1,2,2,3])

//: [Next](@next)
