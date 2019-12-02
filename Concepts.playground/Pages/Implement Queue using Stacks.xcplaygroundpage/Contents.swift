//: [Previous](@previous)

/*
Implement the following operations of a queue using stacks.

push(x) -- Push element x to the back of queue.
pop() -- Removes the element from in front of queue.
peek() -- Get the front element.
empty() -- Return whether the queue is empty.
*/

class MyQueue {

    private var inputStack: [Int] = []
    private var outputStack: [Int] = []

    /** Initialize your data structure here. */
    init() {

    }

    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        inputStack.append(x)
    }

    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        peek()
        return outputStack.removeLast()
    }

    /** Get the front element. */
    func peek() -> Int {
        if outputStack.isEmpty {
            while !inputStack.isEmpty {
                outputStack.append(inputStack.removeLast())
            }
        }
        return outputStack.last!
    }

    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return inputStack.isEmpty && outputStack.isEmpty
    }
}

/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */
//: [Next](@next)
