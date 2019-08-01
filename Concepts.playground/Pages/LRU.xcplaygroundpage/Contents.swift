
/*
 Implement a LRU Cache.
 The implementation should provide O(1) running time for lookup.
 */


class ListNode {
    var value: Int

    var next: ListNode?
    var prev: ListNode?

    init(_ value: Int) {
        self.value = value
    }
}

class Queue {
    var head: ListNode?
    var tail: ListNode?
    private(set) var count: Int = 0

    func enqueue(_ value: Int) {
        count += 1
        let node = ListNode(value)
        let oldTail = tail

        tail = node
        if head == nil {
            head = tail
        } else {
            oldTail?.next = tail
            node.prev = oldTail
        }
    }

    func dequeue() -> ListNode? {
        if let oldHead = head {
            self.head = oldHead.next
            if oldHead.next == nil {
                tail = nil
            }
            count = max(0, count - 1)
            return oldHead
        }
        return nil
    }

    func erase(_ node: ListNode) {
        let prev = node.prev
        let next = node.next
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        next?.prev = prev

        node.next = nil
        node.prev = nil
        count = max(0, count - 1)
    }

    func popBack() -> ListNode? {
        if let oldTail = tail {
            tail = tail?.prev
            tail?.next = nil

            oldTail.prev = nil

            if head === tail {
                head = nil
            }
            oldTail.next = nil
            count -= 1
            return oldTail
        }
        return nil
    }
}


class LRUCache {
    private let capacity: Int
    private var cache: [Int: Int] = [:]
    private var keyToNode: [Int: ListNode] = [:]
    private let queue = Queue()

    init(_ capacity: Int) {
        self.capacity = capacity
    }


    func get(_ key: Int) -> Int {
        guard let value = cache[key] else {
            return -1
        }
        remove(key)
        insert(key, value: value)
        return value
    }

    private func insert(_ key: Int, value: Int) {
        cache[key] = value
        queue.enqueue(key)
        keyToNode[key] = queue.head
    }

    private func remove(_ key: Int) {
        cache.removeValue(forKey: key)
        guard let node = keyToNode[key] else {
            return
        }
        queue.erase(node)
        keyToNode.removeValue(forKey: key)
    }

    func put(_ key: Int, _ value: Int) {
        if cache[key] != nil {
            remove(key)
        } else if queue.count == capacity, let keyToRemove = queue.tail?.value {
            remove(keyToRemove)
        }
        insert(key, value: value)
    }

}
