//: [Previous](@previous)

import Foundation

/*
 Given a linked list, remove the nth node from the end of list and return its head.
 */

class Solution {
  func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {

    var dummy = ListNode(0)
    dummy.next = head

    var first: ListNode? = dummy
    var second: ListNode? = dummy

    for _ in 1...(n+1) {
      first = first?.next
    }

    while first != nil {
      first = first?.next
      second = second?.next
    }

    // remove nth node
    second?.next = second?.next?.next
    return dummy.next
  }

}

//: [Next](@next)
