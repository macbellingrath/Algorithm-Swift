import Foundation

/**
 * Definition for singly-linked list.
 */
public class ListNode {
    public var val: Int
    public var next: ListNode?

    public init(_ val: Int) {
        self.val = val
    }
}

// MARK: - Equatable
extension ListNode: Equatable {
    public static func ==(lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val == rhs.val &&
            lhs.next == rhs.next
    }
}


extension ListNode: CustomStringConvertible {
    public var description: String {
        var res = "\(self.val)"

        if let next = self.next {
            res.append(contentsOf: " -> \(next.description)")
        }
        return res
    }
}
