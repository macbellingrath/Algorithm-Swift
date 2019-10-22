//: [Previous](@previous)

/**
 108. Convert Sorted Array to Binary Search Tree
 Given an array where elements are sorted in ascending order, convert it to a height balanced BST.

 For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.
*/
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {

    func sortedArrayToBST(_ nums: [Int]) -> TreeNode<Int>? {
        return helper(nums: nums, start: 0, end: nums.count - 1)
    }

    private func helper(nums: [Int], start: Int, end: Int) -> TreeNode<Int>? {
        if start > end { return nil }
        var mid = (start + end) / 2

        let node = TreeNode(nums[mid])

        node.left = helper(nums: nums, start: start, end: mid - 1)
        node.right = helper(nums: nums, start: mid + 1, end: end)
        return node
    }
}
//: [Next](@next)
