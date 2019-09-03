//: [Previous](@previous)

import Foundation
/*
 347. Top K Frequent Elements
 Given a non-empty array of integers, return the k most frequent elements.

 * You may assume k is always valid, 1 ≤ k ≤ number of unique elements.
 * Your algorithm's time complexity must be better than O(n log n), where n is the array's size.

 */


class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var buckets = [[Int]](repeating: [], count: nums.count + 1)
        var frequencies: [Int: Int] = [:]
        for num in nums {
            frequencies[num] = frequencies[num, default: 0] + 1
        }

        for (key, frequency) in frequencies {
            buckets[frequency].append(key)
        }

        var res: [Int] = []
        var j = buckets.count - 1
        while j >= 0, res.count < k {
            res.append(contentsOf: buckets[j])
            j -= 1
        }

        return res
    }
}

let solution = Solution()
// test 1
func testOne() {
    let nums = [1,1,1,2,2,3]
    let k = 2
    let topK = solution.topKFrequent(nums, k)
    topK == [1,2]
}
testOne()

// test 2
func testTwo() {
    let nums = [1]
    let k = 1
    let topK = solution.topKFrequent(nums, k)
    topK == [1]
}
testTwo()

//: [Next](@next)
