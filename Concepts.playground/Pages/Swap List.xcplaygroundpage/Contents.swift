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

    func reverse(head: Node) -> Node {
        var head = head

        if head.next == nil {
            return head
        }

        var previous: Node?
        var current = head
        var next = head.next

        while next != nil && (next! !== current) {
            current.next = next?.next
            next?.next = current

            if previous == nil {
                previous = next
                head = previous!
                previous = previous?.next
            } else {
                previous?.next = next
                previous = previous?.next?.next
            }

            guard let n = current.next else {
                break
            }

            current = n

            next = next?.next?.next?.next
        }

        return head
    }
}

let s = Solution()
print(s.reverse(head: head))



//: [Next](@next)
