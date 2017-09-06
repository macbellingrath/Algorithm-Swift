//: [Previous](@previous)

import Foundation

class Vertex<T: Hashable> {

    var value: T
    var neighbors: [(Vertex, Double)] = []
    var pathLengthFromStart = Double.infinity
    var pathsFromStart: [Vertex] = []

    func clear() {
        pathLengthFromStart = .infinity
        pathsFromStart.removeAll()
    }

    init(value: T) {
        self.value = value
    }
}
extension Vertex: Hashable {
    var hashValue: Int {
        return value.hashValue
    }
}

extension Vertex: Equatable {
    static func ==(l: Vertex, r: Vertex) -> Bool {
        return l.hashValue == r.hashValue
    }
}

class Dijkstra<T: Hashable> {
    var totalVertices: Set<Vertex<T>>

    init(vertices: Set<Vertex<T>>) {
        self.totalVertices = vertices
    }

    func reset() {
        totalVertices.forEach({ $0.clear() })
    }

    func traverse(source: Vertex<T>) {
        reset()

        source.pathLengthFromStart = 0
        source.pathsFromStart.append(source)

        var current: Vertex<T>? = source

        while let vertex = current {
            totalVertices.remove(vertex)

            if totalVertices.isEmpty {
                break
            }

            // only non visited
            let filtered = vertex.neighbors.filter { totalVertices.contains($0.0) }


            for neighbor in filtered {
                let neighborVertex = neighbor.0
                let neighborWeight = neighbor.1

                // calculate new possible weight 
                let newWeight = neighborWeight + vertex.pathLengthFromStart

                if newWeight < neighborVertex.pathLengthFromStart {
                    neighborVertex.pathLengthFromStart = newWeight
                    neighborVertex.pathsFromStart = vertex.pathsFromStart
                    neighborVertex.pathsFromStart.append(neighborVertex)
                }

                current = totalVertices.min(by: { (v1, v2) -> Bool in
                    v1.pathLengthFromStart < v2.pathLengthFromStart
                })
            }
        }
    }
}

let v = Vertex(value: 1)
let v2 = Vertex(value: 2)
let v3 = Vertex(value: 3)
v.neighbors = [(v2, 10)]
v2.neighbors = [(v3, 24)]

let d = Dijkstra(vertices: Set([v, v2, v3]))
d.traverse(source: v)

print(v3.pathLengthFromStart)


//: [Next](@next)
