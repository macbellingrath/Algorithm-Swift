//: [Previous](@previous)

/*
 Given a binary search tree and a node in it, find the in-order successor of that node in the BST.
 */
class Node {
    
    var value: Int
   
    var left: Node?
    var right: Node?
    var parent: Node?
    
    init(_ value: Int) {
        self.value = value
    }
    
    func insert(_ node: Node) {
        if node.value < value {
            if let left = left {
                left.insert(node)
            } else {
                left = node
                node.parent = self
            }
        } else {
            if let right = right {
                right.insert(node)
            } else {
                right = node
                node.parent = self
            }
        }
    }
    
    func inOrderSuccessor() -> Node? {
        // lowest node whose value is greater than self
        if let right = right {
            return minimum(right)
        } else {
            var current: Node? = self
            var parent = self.parent
            
            while current == parent?.right {
                current = parent
                parent = parent?.parent
            }
            
            return parent
        }
    }
    
    private func minimum(_ node: Node) -> Node {
        var node = node
        while let left = node.left {
            node = left
        }
        return node
    }
}

extension Node: Comparable {
    static func < (lhs: Node, rhs: Node) -> Bool {
        return lhs.value < rhs.value
    }
    
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.value == rhs.value
    }
}

extension Node {
    func makeDescription() -> String {
        var map: [Int: [Node]] = [:]
        Node.buildMap(node: self, map: &map, height: 0)
        var res = ""
        for (height, nodes) in map.sorted(by: { $0.key < $1.key }) {
            print("height: \(height) -> \(nodes)")
            res.append(contentsOf: nodes.map({ String($0.value) }).joined(separator: " - "))
            res.append("\n")
        }
        
        return res
    }
  
    
    class func buildMap(node: Node?, map: inout [Int: [Node]], height: Int) {
        guard let node = node else { return }
        
        if map[height] != nil {
            map[height]!.append(node)
        } else {
            map[height] = [node]
        }
        
        buildMap(node: node.left, map: &map, height: height + 1)
        buildMap(node: node.right, map: &map, height: height + 1)
    }
}
// build a tree

let root = Node(40)
for i in 1...100 {
    root.insert(Node(i))
}
print(root.makeDescription())

//: [Next](@next)
