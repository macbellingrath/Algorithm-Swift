//: [Previous](@previous)

import Foundation

class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var answer = [-1, -1]

        if nums.isEmpty { return answer }
        var i = 0, j = nums.count - 1

        while i < j {
            let mid = (i + j) / 2
            if nums[mid] < target {
                i = mid + 1
            } else {
                j = mid
            }
        }

        if nums[i] != target { return answer }
        answer[0] = i


        j = nums.count - 1

        while i < j {
            let mid = ((i + j) / 2) + 1
            if nums[mid] > target {
                j = mid - 1
            } else {
                i = mid
            }
        }

        answer[1] = j

        return answer
    }
}

let s = Solution()
s.searchRange([6], 5)
//: [Next](@next)
