import Foundation

// Start of class Node
class Node {
    var data: Int
    var next: Node?

    init(d: Int) {
        data = d
    }
} // End of class Node

// Start of class LinkedList
class LinkedList {
    func insert(head: Node?, data: Int) -> Node? {
        if head == nil {
            return Node(d: data)
        }

        head?.next = insert(head: head?.next, data: data)

        return head
    }

    func display(head: Node?) {
        if head != nil {
            print(head!.data, terminator: " ")

            display(head: head?.next)
        }
}

    // Start of function removeDuplicates
    func removeDuplicates(head: Node?) -> Node? {
        var n = head

        while n != nil {
            while n!.next != nil &&
                n!.data == n!.next?.data {
                n!.next = n!.next?.next
            }
            n = n?.next
        }

        return n
    }
}


var head: Node?
let linkedList = LinkedList()

if let t = readLine().flatMap({Int($0)}){
    for _ in 0..<t {
        head = linkedList.insert(head: head, data: Int(readLine()!)!)
    }

    linkedList.display(head: linkedList.removeDuplicates(head: head))
}
