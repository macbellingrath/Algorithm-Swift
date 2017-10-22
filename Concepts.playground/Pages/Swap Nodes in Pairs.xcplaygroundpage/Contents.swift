//: [Previous](@previous)

import Foundation

 class Solution {

    /// Given a linked list, swap every two adjacent nodes and return its head.
    ///  1-2-3-4 => 2-1-4-3
    /// - Parameter head: head node
    /// - Returns: the head node of the new list
    func swapPairs(_ head: ListNode?) -> ListNode? {
        let toReturn = head?.next

        var one = head
        var two = head?.next

        while two != nil {
            let temp = two?.next
             two?.next = one
            one?.next = temp

            one = temp?.next
            two = temp?.next?.next
        }


        return toReturn
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
    print(head!.val)
    var h = head
    while let next = h?.next {
        print(next.val)
        h = next
    }
}

printList(s.swapPairs(input[0]))
//: [Next](@next)
