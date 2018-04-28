//: [Previous](@previous)

import Foundation

class ListNode: CustomStringConvertible {
    let value: Int
    var next: ListNode?

    init(_ value: Int, next: ListNode? = nil) {
        self.value = value
        self.next = next
    }

    var description: String {
        var descrip = "\(value)"

        if let next = next {
            descrip.append(" => " + next.description)
        }

        return descrip
    }
}

class Solution {
    // [1 2 3 4] => [4 3 2 1 ]
    // previous = nil
    // current = 1
    // next = 2

    // while next != nil
        // temp = next.next
        // next.next = current
        // current = temp
     func reverseList(_ head: ListNode?) -> ListNode? {
        var previous: ListNode?
        var current = head

        while current != nil {
            let temp = current?.next // 2

            current?.next = previous // 1 > nil

            previous = current
            current = temp
        }

        return previous
    }
}


var one = ListNode(1)
var two = ListNode(2)
var three = ListNode(3)

one.next = two
two.next = three

let solution = Solution()
print("before: \(one)")
if let node = solution.reverseList(one) {
    print("after: \(node)")
}



//: [Next](@next)
