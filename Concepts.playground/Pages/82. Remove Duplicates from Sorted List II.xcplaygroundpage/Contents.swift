//: [Previous](@previous)

/*
Given a sorted linked list, delete all nodes that have duplicate numbers, leaving only distinct numbers from the original list.
 */
class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        var prev: ListNode? = dummy
        var current: ListNode? = head

        while current != nil {
            while current?.next?.val == current?.val {
                current = current?.next
            }

            if prev?.next === current {
                prev = prev?.next
            } else {
                prev?.next = current?.next
            }

            current = current?.next
        }

        return dummy.next
    }
}
//: [Next](@next)
