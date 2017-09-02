//: [Previous](@previous)
import Foundation

// MARK: Setup 

class Node: CustomStringConvertible {
    var next: Node?
    var value: Int

    init(value: Int) {
        self.value = value
    }

    var description: String {
        var s = ""
        s += "\(value)"

        if let n = next {
            s += " -> "
            s += n.description
        }

        return s
    }

}

let head = Node(value: 1)
var current = head

for i in 2...11 {

    let n = Node(value: i)

    current.next = n
    current = n
}





class Solution {
    // example
    // input: 1 -> 2 -> 3 -> 4 -> 5
    // output: 2 -> 1 -> 4 -> 3 -> 5

    // n = 1 
    // n.next = 2 
    // n.next.next = 3

    func reverse(head: Node) -> Node {
        if head.next == nil {
            return head
        }

        var head    = head

        var previous: Node?
        var current = head
        var next    = head.next

        while next != nil && (next! !== current) {
            current.next = next?.next
            next?.next = current

            if previous == nil {
                previous = next
                head     = previous!
                previous = previous?.next
            } else {
                previous?.next = next
                previous       = previous?.next?.next
            }

            guard let n = current.next else {
                break
            }

            current = n

            next = next?.next?.next?.next
        }

        return head
    }

    func otherReverse(head: Node) -> Node {
        if head.next == nil { return head }
        var head = head

        var previous: Node? // null
        var current = head // 1
        var next = head.next // 2

        while next != nil && (next! !== current) {
            // swap
            current.next = next!.next // 1.next = 2
            next!.next   = current // 2.next = 1

            if previous == nil {
                previous = next  // p = 2 // current =  1 // next = 2
                head     = next!
                previous = next?.next
            } else {
                previous?.next = next
                previous = previous?.next?.next
            }

            if current.next == nil {
                break
            }

            current = current.next!
            next = next?.next?.next?.next
        }

        return head
    }
}

let s = Solution()
//print(s.reverse(head: head))

print(s.otherReverse(head: head))

//: [Next](@next)
