//: [Previous](@previous)

import Foundation

/*
Sort a linked list in O(n log n) time using constant space complexity.

Example 1:

Input: 4->2->1->3
Output: 1->2->3->4
Example 2:

Input: -1->5->3->4->0
Output: -1->0->3->4->5
*/

class Solution {

    func sortList(_ head: ListNode?) -> ListNode? {
        guard head?.next != nil else { return head }

        var split = self.split(list: head)
        split.a = sortList(split.a)
        split.b = sortList(split.b)

        return sortedMerge(a: split.a, b: split.b)
    }

    private func sortedMerge(a: ListNode?, b: ListNode?) -> ListNode? {
        guard let a = a else { return b }
        guard let b = b else { return a }
        var res: ListNode?

        if a.val <= b.val {
            res = a
            res?.next = sortedMerge(a: a.next, b: b)
        } else {
            res = b
            res?.next = sortedMerge(a: a, b: b.next)
        }
        return res
    }

    private func split(list: ListNode?) -> (a: ListNode?, b: ListNode?) {
        var slow = list
        var fast = list?.next
        while fast != nil {
            fast = fast?.next
            if fast != nil {
                fast = fast?.next
                slow = slow?.next
            }
        }
        let back = slow?.next
        slow?.next = nil
        return (a: list, b: back)
    }

}


let head = ListNode(Int.random(in: 0..<100))
var current: ListNode? = head
for i in 1...10 {
    let rand = Int.random(in: -100..<100)
    current?.next = ListNode(rand)
    current = current?.next
}

print("unsorted list is: \(head)")
let solution = Solution()
let sorted = solution.sortList(head)!
print("sorted list is: \(sorted)")

//: [Next](@next)
