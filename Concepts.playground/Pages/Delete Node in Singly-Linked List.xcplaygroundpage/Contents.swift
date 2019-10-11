//: [Previous](@previous)

/*
 Write a function that deletes a node in a singly linked list.

 */
class Node {
    var value: Int
    var next: Node?


    init(_ value: Int) {
        self.value = value
    }
}

class Solution {
    func delete(_ node: Node) {
        var current: Node? = node
        while current != nil {
            if let next = current?.next {
                current?.value = next.value
            }
            current?.next = current?.next?.next
            current = current?.next
        }
    }
}

//: [Next](@next)
