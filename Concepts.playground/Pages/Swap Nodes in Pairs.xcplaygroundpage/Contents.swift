//: [Previous](@previous)

import Foundation

/**
 * Definition for singly-linked list.
 */
 class ListNode {
     var val: Int
     var next: ListNode?

    init(_ val: Int) {
        self.val = val
     }
 }

 class Solution {

    /// Given a linked list, swap every two adjacent nodes and return its head.
    ///  1-2-3-4 => 2-1-4-3
    /// - Parameter head: head node
    /// - Returns: the head node of the new list
    func swapPairs(_ head: ListNode?) -> ListNode? {
        //  n == 1
        if head?.next == nil {
            return head
        }

        var dummy = head!.next!

        var previous: ListNode? //
        var current: ListNode? = head //1

        while let next = current?.next {
            var temp = next.next
            current?.next = previous // 1.next = nil
            next.next = current // 2.next = 1

            previous = current // move slow pointer
            current = temp
        }

        return dummy
    }
}

// Test cases
let s = Solution()
let input: [ListNode] = [
    ListNode(1),
    ListNode(2),
    ListNode(3),
    ListNode(4)
]

for i in 0..<input.count - 1 {
    input[i].next = input[i + 1]
}

func printList(_ head: ListNode?) {
    print(head?.val)
    var h = head
    while let next = h?.next {
        print(next.val)
        h = next
    }
}

printList(s.swapPairs(input[0]))
//: [Next](@next)
