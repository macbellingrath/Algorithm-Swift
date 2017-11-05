//: [Previous](@previous)

import Foundation

class Solution {

    /// Invert Tree
    ///   Run time complexity is O(n), space complexity is O(n) for stack space
    /// - Parameter root: root node
    /// - Returns: root
    func invert(_ root: TreeNode<Int>?) -> TreeNode<Int>? {
        guard let root = root else { return nil }

        root.left = invert(root.right)
        root.right = invert(root.left)

        return root
    }
}

/*
 Example Input =>

          9
       /     \
      5      20
     / \     / \
    3   7   12  27

 Example Output =>

           9
       /      \
      20       5
     / \      / \
    27  12   7   3

 */


let s = Solution()
s.invert(TreeNode(9))


//: [Next](@next)
