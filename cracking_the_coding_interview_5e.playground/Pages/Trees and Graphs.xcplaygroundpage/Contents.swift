//: [Previous](@previous)

/*
 4.1 - Implement a function to check if a tree is balanced For the purposes of this question, a balanced tree is defined to be a tree such that no two leaf nodes differ in distance from the root by more than one.
 */
class TreeNode<T: Comparable> {
    var value: T
    var left: TreeNode?
    var right: TreeNode?

    init(_ value: T) {
        self.value = value
    }
}

extension TreeNode {
    
    static func height(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        let lHeight = height(root.left)
        if lHeight == -1 { return -1 }
        
        let rHeight = height(root.right)
        if rHeight == -1 { return -1 }
        
        if abs(lHeight - rHeight) > 1 {
            return -1
        }
        
        return max(lHeight, rHeight) + 1
    }
    /// A tree is balanced if no two leaf nodes differ in distance from the root by more than 1.
    ///
    /// - Parameter root: root node of tree
    static func isBalanced(_ root: TreeNode?) -> Bool {
        return height(root) != -1
    }
}


/*
 Given a binary search tree and a node in it, find the in-order successor of that node in the BST.
 */

extension TreeNode {
    
    var inOrderSuccessor: TreeNode? {
        return nil
        // lowest node whose value is greater than self
        
    }
}
//: [Next](@next)
