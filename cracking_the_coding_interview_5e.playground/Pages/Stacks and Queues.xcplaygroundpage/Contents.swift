//: [Previous](@previous)

import Foundation


public class Stack<T> {

    public init () {

    }

    public func push(_ item: T) {
        let node = Node(item)
        node.next = top
        top = node
    }

    public func pop() -> T? {
        let temp = top
        top = temp?.next
        return temp?.value
    }

    public func peek() -> T? {
        return top?.value
    }

    public var isEmpty: Bool {
        return top == nil
    }

    private class Node<T> {
        let value: T
        var next: Node?

        init(_ value: T) {
            self.value = value
        }
    }

    private var top: Node<T>?

}


let stack = Stack<Int>()
stack.push(3)
stack.push(2)
stack.push(1)

stack.peek()
stack.pop()
stack.peek()

// Implement a Queue using two stacks
class MyQueue<T>  {
    var stackOne = Stack<T>()
    var stackTwo = Stack<T>()

    func enqueue(_ item: T) {
        if !stackTwo.isEmpty {
            while let next = stackTwo.pop() {
                stackOne.push(next)
            }
        }

        stackOne.push(item)
    }

    func dequeue() -> T? {
        while let next = stackOne.pop() {
            stackTwo.push(next)
        }

        return stackTwo.pop()
    }

    var isEmpty: Bool {
        return stackOne.isEmpty &&
            stackTwo.isEmpty
    }
}

let queue = MyQueue<Int>()
queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)

queue.dequeue()
queue.dequeue()
queue.dequeue()
queue.dequeue()

//: [Next](@next)
