//: [Previous](@previous)
// 145. Binary Tree Postorder Traversal

class Solution {
    
    // recurisvely
    func postorderTraversal(_ root: TreeNode<Int>?) -> [Int] {
        var res: [Int] = []
        guard let root = root else { return res }
        res.append(contentsOf: postorderTraversal(root.left))
        res.append(contentsOf: postorderTraversal(root.right))
        res.append(root.value)
        return res
    }
    
    // iteritively
    func postorderTraversalIteritive(_ root: TreeNode<Int>?) -> [Int] {
        var res: [Int] = []  // we will use O(1) space for the answer
        guard let root = root else { return res }
        
        var stack: [TreeNode<Int>] = [root] // we will use O(1) space for the stack
        while let next = stack.popLast() { // popLast runs in O(1) time, and we'll visit each node 1 time making this loop linear.
            // post order
            res.append(next.value)
            
            // left
            if let left = next.left {
                stack.append(left)
            }
            
            // right
            if let right = next.right {
                stack.append(right)
            }
        }

        return res.reversed() // reversed collection is lazy
    }

}

//: [Next](@next)
