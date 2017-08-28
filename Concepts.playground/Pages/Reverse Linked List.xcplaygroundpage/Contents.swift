//: [Previous](@previous)

import Foundation

/*
 PI - 1:
 i.) Reverse a Linked List?
 */
class LinkedList {
    var next: LinkedList?
    let value: Int

    init(value: Int) {
        self.value = value
    }
}

class Solution {
    func reverse(_ list: LinkedList) -> LinkedList {
        var prev: LinkedList?
        var current: LinkedList? = list
        var next:LinkedList?

        while current != nil {
            next = current?.next
            current?.next = prev
            prev = current
            current = next
        }

        return prev ?? list
    }
}

let l1 = LinkedList(value: 1)
let l2 = LinkedList(value: 2)
let l3 = LinkedList(value: 3)
l1.next = l2; l2.next = l3

let s = Solution()
let new = s.reverse(l1)
let seq = sequence(first: new, next: {$0.next})

for x in seq {
    print(x.next?.value, x.value)
}

//: [Next](@next)
