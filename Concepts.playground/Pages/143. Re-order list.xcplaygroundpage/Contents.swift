//: [Previous](@previous)


final class Solution {
    @inline(__always)
    final func reorderList(_ head: ListNode?) {
        var p1 = head
        var p2 = head
        // loop while the fast pointer's next two nodes are non-null, advancing the slow pointer once per iteration and the fast pointer twice per iteration
        while let next = p2?.next?.next {
            p1 = p1?.next
            p2 = next
        }
        
        // reverse linked list from midpoint to end
        let middle = p1
        let current = p1?.next
        // 123 456 -> 123 654
        
        // loop while fast pointer's next node is non-null
        while let temp = current?.next {
            current?.next = temp.next
            temp.next = middle?.next
            middle?.next = temp
        }
        
        // reorder the list from the head, stopping when we reach the middle
        p1 = head
        p2 = middle?.next
        
        while p1 !== middle {
            middle?.next = p2?.next
            p2?.next = p1?.next
            p1?.next = p2
            p1 = p2?.next
            p2 = middle?.next
        }
    }
}

//: [Next](@next)
