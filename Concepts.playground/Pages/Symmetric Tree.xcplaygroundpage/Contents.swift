//: [Previous](@previous)

import Foundation

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

/*
 Symmetric Tree
Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).

For example, this binary tree [1,2,2,3,4,4,3] is symmetric
 but the following [1,2,2,null,3,null,3] is not.
*/

class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }

        return isMirror(root.left, root.right)
    }

    private func isMirror(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
       if left == nil, right == nil { return true }
       if let left = left, let right = right {
           return left.val == right.val && isMirror(left.right, right.left) && isMirror(left.left, right.right)
       }

        return false
    }
}

//: [Next](@next)
