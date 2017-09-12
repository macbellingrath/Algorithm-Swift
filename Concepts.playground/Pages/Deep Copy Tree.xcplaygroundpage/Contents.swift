//: [Previous](@previous)

import Foundation

class Node: Equatable, CustomStringConvertible, Hashable {
    let value: Int
    var children: [Node]

    init(_ value: Int, _ children: [Node] = []) {
        self.value = value
        self.children = children
    }

    func copy() -> Node {
        let c = children.map { $0.copy() }
        return Node(value, c)
    }

    var description: String {
        var res = "<" + value.description + ">"
        for c in children {
            res += c.description
        }
        return res
    }

    var hashValue: Int {
        return value.hashValue
    }
}


class Graph: Equatable, CustomStringConvertible {

    let vertices: [Node]

    init(_ v: [Node]) {
        self.vertices = v
    }

    func copy() -> Graph {
        return Graph(vertices.map({ (node) in
            return node.copy()
        }))
    }

    var description: String {
        return "<Graph>\n" + "vertices: " + vertices.map({$0.description}).joined(separator: "\n")
    }
}

extension Node {
    static func == (l: Node, r: Node) -> Bool {
        if l === r { return true }

        for v in l.children {
            for j in r.children {
                if v == j {
                    return true
                }
            }
        }
        return false
    }
}
extension Graph {
    static func == (l: Graph, r: Graph) -> Bool {
        if l === r { return true }

        for v in l.vertices {
            for j in r.vertices {
                if v == j {
                    return true
                }
            }
        }

        return false
    }
}

/*
 Task : Peform a `deep` copy of graph structure
*/

class Solution {
    func clone(_ source: Node) -> Node {
        // make a queue
        var q: [Node] = []
        // map of visited
        var map: [Node: Node] = [:]

        // enque the root
        q.insert(source, at: 0)

        // make copy
        var node = Node(source.value)

        // visit node
        map[source] = node

        // deque
        while let n = q.popLast() {

            for neighbor in n.children {
                if map[neighbor] == nil {

                    node = Node(neighbor.value)
                    map[neighbor] = node

                    // enqueue
                    q.insert(node, at: 0)
                }

                map[n]?.children.insert(neighbor, at: 0)
            }
        }

        return map[source]!
    }
}


let v1 = Node(1)
let v2 = Node(2)
let v0 = Node(0, [v1, v2])

let g = Graph([v0,v1,v2])
Solution().clone(v0)

//: [Next](@next)
