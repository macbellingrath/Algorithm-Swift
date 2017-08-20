//: [Previous](@previous)

import Foundation


//Definition for singly-linked list.
class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
    }
 }

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1, let l2 = l2 else {
            return nil
        }

        let l = sequence(first: l1) { $0.next }
            .reversed()
            .map({ $0.val })
            .map { String($0) }
            .joined()

        let r = sequence(first: l2) { $0.next }
            .reversed()
            .map({ $0.val })
            .map { String($0) }
            .joined()

        let lNum = Int(l)!
        let rNum = Int(r)!

        let sum = lNum + rNum

        let digits = String(sum)
            .characters
            .reversed()
            .flatMap({ Int(String($0) )})

        var listNode: ListNode?

        for digit in digits {
            if listNode == nil {
                listNode = ListNode(digit)
            } else {
                var current = listNode?.next
                while current != nil {
                    current = current?.next
                }
                current?.next = ListNode(digit)
            }
        }

        return listNode
    }
}

//: [Next](@next)
