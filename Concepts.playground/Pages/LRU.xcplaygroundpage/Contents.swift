//: [Previous](@previous)

import Foundation

/*
 Implement a LRU Cache.
 The implementation should provide O(1) running time for lookup.
 */


class ListNode {
    let value: Int

    var next: ListNode?
    var prev: ListNode?

    init(val: Int) {
        self.value = val
    }

}

class Queue {

    var head: ListNode?
    var tail: ListNode?
    private(set) var count: Int = 0

    func enqueue(_ value: Int) {
        let node = ListNode(val: value)
        if head == nil {
            head = node
            tail = head
        }

        node.next = head
        head?.prev = node
        head = node
        count += 1
    }

    func dequeue() -> ListNode? {
        let temp = head
        head = head?.next
        head?.prev = nil
        temp?.next = nil
        count = max(0, count - 1)
        return temp
    }

    func erase(_ node: ListNode) {
        if node === head {
            dequeue()
        } else if node === tail {
            popBack()
        } else {
            let prev = node.prev
            let next = node.next
            prev?.next = next

            node.prev = nil
            node.next = nil

            count = max(0, count - 1)
        }
    }

    func popBack() -> ListNode? {
        let temp = tail
        tail?.prev?.next = nil
        tail = tail?.prev

        temp?.next = nil
        temp?.prev = nil
        count = max(0, count - 1)
        return temp
    }
}

extension Queue: CustomPlaygroundDisplayConvertible {
    var playgroundDescription: Any {
        return "queue count - \(count), head: \(head?.value ?? -1), tail: \(tail?.value ?? -1)"
    }
}



class LRUCache {
    private let capacity: Int
    private var hashTable: [Int: ListNode] = [:]
    private let queue = Queue()

    init(_ capacity: Int) {
        self.capacity = capacity
    }

    func get(_ key: Int) -> Int {
        if let node = hashTable[key] {
            // move to front
            queue.erase(node)
            queue.enqueue(node.value)
            hashTable[key] = queue.head

            return node.value
        }
        return -1
    }

    func put(_ key: Int, _ value: Int) {
        if get(key) == -1 {
            if queue.count == capacity {
                if let last = queue.popBack() {
                    print("evicting \(last.value)")
                    for (key, value) in hashTable {
                        if value === last {
                            hashTable.removeValue(forKey: key)
                            break
                        }
                    }
                    hashTable.removeValue(forKey: last.value)
                }
            }
            queue.enqueue(value)
            hashTable[key] = queue.head
        }
    }

}

// Test
let lru = LRUCache(2)
// put [1,1]
lru.put(1, 9)
// put [2,2]
lru.put(2, 18)
// get 1
lru.get(1) == 9
// put [3,3]
lru.put(3, 27)

// get 2
lru.get(2) == -1
// put [4,4]
lru.put(4, 36)
// get 1
lru.get(1) == -1
// get 3
lru.get(3) == 27
// get 4
lru.get(4) == 36


//: [Next](@next)
