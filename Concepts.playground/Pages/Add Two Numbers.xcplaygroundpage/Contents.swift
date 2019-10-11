//: [Previous](@previous)

import Foundation

/*
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

 You may assume the two numbers do not contain any leading zero, except the number 0 itself.

 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 
*/


public class ListNode: CustomStringConvertible {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
         self.val = val
         self.next = nil
    }

    public var description: String {
        var s  = val.description

        if let n = next {
            s += n.description
        }

        return s
    }
}


 


let s = Solution()

let first = ListNode(0)
first.next = ListNode(8)

let second = ListNode(0)
second.next = ListNode(2)

print(
    s.addTwoNumbers(first, second)
)
//: [Next](@next)
