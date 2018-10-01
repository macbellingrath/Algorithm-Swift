//: [Previous](@previous)


/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

/*
 Merge k sorted linked lists and return it as one sorted list. Analyze and describe its complexity.
 Input:
 [
     1->4->5,
     1->3->4,
     2->6
 ]
 Output: 1->1->2->3->4->4->5->6
 */

class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var priorityQueue = PriorityQueue<ListNode> {
            $0.val < $1.val
        }

        for case let list? in lists {
            priorityQueue.enqueue(list)
        }

        var point = ListNode(0) // dummy
        let head = point

        while let list = priorityQueue.dequeue() {
            point.next = list

            if let next = list.next {
                priorityQueue.enqueue(next)
            }
            point = list
        }


        return head.next
    }
}

//: [Next](@next)
