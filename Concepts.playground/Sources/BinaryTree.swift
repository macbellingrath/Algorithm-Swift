import Foundation

public class TreeNode<Value: Comparable> {
    public var left: TreeNode?
    public var right: TreeNode?
    public var value: Value

    public init(_ value: Value) {
        self.value = value
    }
}
