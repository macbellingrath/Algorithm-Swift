//: [Previous](@previous)

import Foundation

class Node {
    var left: Node?
    var right: Node?
    var key: Int

    init(_ key: Int) {
        self.key = key
    }
}

func calculateHorizontalDistance(node: Node?, height: Int, map: inout [Int: [Int]]) {
    guard let node = node else {
        return
    }

    // pre order
    if var list = map[height] {
        list.append(node.key)
    } else {
        map[height] = [node.key]
    }

    // left
    calculateHorizontalDistance(node: node.left, height: height - 1, map: &map)

    // right
    calculateHorizontalDistance(node: node.right, height: height + 1, map: &map)
}

func printColumns(root: Node) {
    var map = [Int: [Int]]()
    calculateHorizontalDistance(node: root, height: 0, map: &map)

    for level in map {
        for height in level.value {
            print(height)
        }
    }
}


//: [Next](@next)
