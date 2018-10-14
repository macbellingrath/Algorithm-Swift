//: [Previous](@previous)
class Queue<T> {
    class Node<T> {
        let value: T
        var next: Node?
        init(_ value: T) {
            self.value = value
        }
    }

    private var front: Node<T>?
    private var back: Node<T>?

    var isEmpty: Bool {
        return front == nil
    }

    func enqueue(_ item: T) {
        let node = Node(item)

        if isEmpty {
            back = node
            front = back
        } else {
            back?.next = node
            back = back?.next
        }
    }

    func dequeue() -> T? {
        guard !isEmpty else {
            return nil
        }

        let item = front
        front = front?.next
        return item?.value
    }

}

func traverseLevels(_ tree: TreeNode<Int>?) {
    guard let tree = tree else { return }
    let queue = Queue<TreeNode<Int>>()
    queue.enqueue(tree)

    while let current = queue.dequeue() {
        print(current.value)

        if let left = current.left {
            queue.enqueue(left)
        }

        if let right = current.right {
            queue.enqueue(right)
        }
    }
}

let a = TreeNode(10)
let b = TreeNode(5)
let c = TreeNode(15)
a.left = b
a.right = c
let d = TreeNode(6)
b.right = d


traverseLevels(a)
//: [Next](@next)
