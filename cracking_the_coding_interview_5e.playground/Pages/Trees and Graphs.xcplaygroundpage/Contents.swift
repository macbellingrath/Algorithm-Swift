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

    /// A tree is balanced if no two leaf nodes differ in distance from the root by more than 1.
    ///
    /// - Parameter root: root node of tree
    static func isBalanced(_ root: TreeNode?) -> Bool {
        // left distance
        
    }
}
//: [Next](@next)
