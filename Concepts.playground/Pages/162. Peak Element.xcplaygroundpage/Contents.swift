//: [Previous](@previous)

/*
 162. Find Peak Element
 A peak element is an element that is greater than its neighbors.

 Given an input array nums, where nums[i] ≠ nums[i+1], find a peak element and return its index.

 The array may contain multiple peaks, in that case return the index to any one of the peaks is fine.

 You may imagine that nums[-1] = nums[n] = -∞.
 */

class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        var low = 0
        var high = nums.count - 1
        while low < high {
            let mid1 = (low + high) >> 1
            let mid2 = mid1 + 1

            if nums[mid1] < nums[mid2] {
                low = mid2
            } else {
                high = mid1
            }
        }
        return low
    }
}


extension Array where Element: Comparable {
    var peak: Element? {
        guard !isEmpty else { return nil }
        var low = 0
        var high = count - 1
        while low < high {
            let mid = (low + high) >> 1
            let mid2 = mid + 1
            if self[mid] < self[mid2] {
                low = mid2
            } else {
                high = mid
            }
        }
        return self[low]
    }
}

//: [Next](@next)
