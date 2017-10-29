//: [Previous](@previous)

import Foundation

class Solution {
    func invert(_ root: TreeNode<Int>?) -> TreeNode<Int>? {
        guard let root = root else { return nil }

        let right = invert(root.right)
        let left = invert(root.left)
        root.left = right
        root.right = left

        return root
    }
}

//: [Next](@next)
