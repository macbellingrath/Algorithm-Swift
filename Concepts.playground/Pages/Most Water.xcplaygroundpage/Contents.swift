//: [Previous](@previous)

import Foundation

/* 
 Given n non-negative integers a1, a2, ..., an, where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.

 Note: You may not slant the container and n is at least 2.
 */

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var i = 0
        var j = height.count - 1
        var maxH = 0

        while i < j {
            maxH = max(maxH, ((j - i) * (min(height[i], height[j]))))

            if height[i] < height[j] {
                i += 1
            } else if height[i] >= height[j] {
                j -= 1
            }
        }

        return maxH
    }
}


let s = Solution()
s.maxArea([1,919,192,29,12,10])
//: [Next](@next)
