//: [Previous](@previous)

/**
 Given two arrays, write a function to compute their intersection.

 */
class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var map: [Int: Int] = [:]
        var res: [Int] = []

        for num in nums1 {
            map[num] = (map[num] ?? 0) + 1
        }

        for num in nums2 {
            if let count = map[num], count > 0 {
                map[num] = map[num]! - 1
                res.append(num)
            }
        }
        return res
    }
}

//: [Next](@next)
