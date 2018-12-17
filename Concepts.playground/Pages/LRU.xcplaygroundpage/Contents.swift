//: [Previous](@previous)

import Foundation

/*
 Implement a LRU Cache.
 The implementation should provide O(1) running time for lookup.
 */

class LRU<T> {
    // LRU usually uses a doubly-linked list and hash to store nodes.
    // We'll provide simple implementations here since using Swift Array would incur O(N) running time for insertion.
    private class List<T> {
        class Node<T> {
            let value: T
            var next: Node?
            var previous: Node?
            
            init(_ value: T) {
                self.value = value
            }
        }
        
        var head: Node<T>?
        var tail: Node<T>?
        
        var count: Int = 0
        
        func enqueue(_ val: T) {
            let node = Node(val)
       
            guard head != nil else {
                head = node
                tail = node
                count += 1
                return
            }
            
            head?.next = node
            node.previous = head
            head = node
            count += 1
        }
        
        func dequeue() -> Node<T>? {
            guard let head = head else { return nil }
            self.head = head.previous
            self.head?.next = nil
            count -= 1
            return head
        }
        
        func moveToFront(node: Node<T>) {
            
        }
    }
}
//: [Next](@next)
