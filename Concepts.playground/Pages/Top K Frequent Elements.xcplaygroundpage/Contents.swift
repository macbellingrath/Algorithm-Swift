//: [Previous](@previous)

import Foundation
/*
 347. Top K Frequent Elements
 Given a non-empty array of integers, return the k most frequent elements.

 * You may assume k is always valid, 1 ≤ k ≤ number of unique elements.
 * Your algorithm's time complexity must be better than O(n log n), where n is the array's size.

 */

private struct Node: Comparable, Hashable {
    var key: Int
    var count: Int

    static func < (lhs: Node, rhs: Node) -> Bool {
        return lhs.count < rhs.count
    }

    static func > (lhs: Node, rhs: Node) -> Bool {
        return lhs.count > rhs.count
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(key)
    }

}

class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var counts: [Int: Node] = [:]
        var maxHeap = PriorityQueue<Node>(sort: >)

        for num in nums {
            if var node = counts[num], let index = maxHeap.index(of: node) {
                node.count += 1
                counts[num] = node
                maxHeap.changePriority(index: index, value: node)
            } else {
                let node = Node(key: num, count: 1)
                counts[num] = node
                maxHeap.enqueue(node)
            }
        }

        var res: [Int] = []
        while res.count < k, let node = maxHeap.dequeue() {
            res.append(node.key)
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

//: [Next](@next)
