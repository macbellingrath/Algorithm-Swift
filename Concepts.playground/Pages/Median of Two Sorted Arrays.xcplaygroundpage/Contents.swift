//: [Previous](@previous)

import Foundation

//:* Time complexity should be O(log (m + n ))

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let combined: [Int] = (nums1 + nums2).sorted()
        if combined.isEmpty {
            return 0
        }

        let i = combined.count / 2

        if combined.count % 2 == 0 {
            let lower = combined.count > 1 ? (i - 1) : i
            return Double((combined[i] + combined[lower])) / 2
        } else {
            return Double(combined[i])
        }
    }
}



let testInput: ([Int], [Int]) = ([1],[3,4])
let testcase2: ([Int], [Int]) = ([1, 3], [2])
let s = Solution()
// print(s.findMedianSortedArrays(testInput.0, testInput.1))
print(s.findMedianSortedArrays(testcase2.0, testcase2.1))


//: [Next](@next)
