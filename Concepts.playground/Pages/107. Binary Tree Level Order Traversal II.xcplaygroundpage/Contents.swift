//: [Previous](@previous)
/*
 107. 107. Binary Tree Level Order Traversal II

 Given a binary tree, return the bottom-up level order traversal of its nodes' values. (ie, from left to right, level by level from leaf to root).

 For example:
 Given binary tree [3,9,20,null,null,15,7],
 */

class Solution {

    private func helper(list: inout [[Int]], root: TreeNode<Int>?, level: Int) {
        guard let root = root else { return }

        if level >= list.count {
            list.insert([], at: 0)
        }

        helper(list: &list, root: root.left, level: level + 1)
        helper(list: &list, root: root.right, level: level + 1)
        list[(list.count - level - 1)].append(root.value)
    }

    func levelOrderBottom(_ root: TreeNode<Int>?) -> [[Int]] {
        var levels: [[Int]] = []
        helper(list: &levels, root: root, level: 0)

        return levels
    }
}
//: [Next](@next)
