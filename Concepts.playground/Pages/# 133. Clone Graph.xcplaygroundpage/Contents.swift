//: [Previous](@previous)

/*

 Given the head of a graph, return a deep copy (clone) of the graph. Each node in the graph contains a label (int) and a list (List[UndirectedGraphNode]) of its neighbors. There is an edge between the given node and each of the nodes in its neighbors.


 OJ's undirected graph serialization (so you can understand error output):
 Nodes are labeled uniquely.

 We use # as a separator for each node, and , as a separator for node label and each neighbor of the node.


 As an example, consider the serialized graph {0,1,2#1,2#2,2}.

 The graph has a total of three nodes, and therefore contains three parts as separated by #.

 First node is labeled as 0. Connect node 0 to both nodes 1 and 2.
 Second node is labeled as 1. Connect node 1 to node 2.
 Third node is labeled as 2. Connect node 2 to node 2 (itself), thus forming a self-cycle.
 */

// Simple Graph Node Definition
class Node {
    var value: Int
    var neighbors: [Node]

    init(_ value: Int, neighbors: [Node] = []) {
        self.value = value
        self.neighbors = neighbors
    }
}

extension Node: Hashable {

    func hash(into hasher: inout Hasher) {
        hasher.combine(value)
        neighbors.forEach { hasher.combine($0) }
        hasher.finalize()
    }

}

extension Node: Equatable {

    static func ==(lhs: Node, rhs: Node) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }

}

// BFS
func traverse(_ node: Node, block: (Node) -> Void) {
    var queue = [node]
    var visited: Set<Node> = []

    // dequeue
    while !queue.isEmpty {
        let next = queue.removeFirst()
        guard !visited.contains(next) else { continue }

        // mark visited
        visited.insert(next)

        // enqueue neighbors
        queue.append(contentsOf: next.neighbors)

        block(next)
    }
}

class Solution {
    // Original to copy since using label would break if graph contained duplicate labels
    private var map: [Node: Node] = [:]

    func cloneGraph(_ graph: Node) -> Node {
        if let cloned = map[graph] {
            return cloned
        }

        let copy = Node(graph.value)
        map[graph] = copy

        // DFS
        for neighbor in graph.neighbors {
            copy.neighbors.append(cloneGraph(neighbor))
        }

        return copy
    }
}



let n3 = Node(3)
let n4 = Node(4)
let n2 = Node(2, neighbors: [n3, n4])
let n1 = Node(1, neighbors: [n2])

traverse(n1) { (node) in
    var node = node6
    withUnsafeMutablePointer(to: &node) {
        print("original = value:\($0.pointee.value), pointer: \($0)")
    }
}

let s = Solution()
let deepCopy = s.cloneGraph(n1)
traverse(deepCopy) { (copied) in
    var node = copied
    withUnsafeMutablePointer(to: &node) {
        print("copied = value:\($0.pointee.value), pointer: \($0)")
    }
}

//: [Next](@next)
