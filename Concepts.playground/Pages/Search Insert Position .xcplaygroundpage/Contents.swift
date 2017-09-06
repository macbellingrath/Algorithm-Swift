//: [Previous](@previous)

import Foundation
/*
 Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

 You may assume no duplicates in the array.

 Here are few examples.
 [1,3,5,6], 5 → 2
 [1,3,5,6], 2 → 1
 [1,3,5,6], 7 → 4
 [1,3,5,6], 0 → 0
 */

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1

        // since nums are sorted, we can perform binary search to reduce search time to O(log n)

        while left <= right {
            let mid = left + (right - left) / 2
            if nums[mid] == target {
                return mid
            } else if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }


        // not found so we return the left pointer
        return left
    }
}

func binarySearch<T: Comparable>(elements: [T], target: T) -> Int? {
    var left = 0
    var right = elements.count - 1

    while left <= right {
        let mid = left + (right - left) / 2

        if elements[mid] == target {
            return mid
        }

        if elements[mid] < target {
            left  = mid + 1
        } else {
            right = mid - 1
        }
    }
    return nil
}



let s = Solution()
s.searchInsert([4,5,5,6,9,10], 6)
binarySearch(elements: [1,2,3], target: 3)
//: [Next](@next)
