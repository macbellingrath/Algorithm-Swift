//: [Previous](@previous)

import Foundation
import UIKit

func binarySearchMatrix(matrix: [[CGRect]], target: CGRect) -> (r: Int, c: Int)? {
    let n = matrix.count
    let m = matrix.first?.count ?? 0
    var l = 0
    var r = m * n - 1

    while l != r {
        let mid = (l + r) >> 1
        print(matrix[mid / m][mid % m].maxY, target.minY)
        if (matrix[mid / m][mid % m].maxX < target.minX && matrix[mid / m][mid % m].maxY < target.minY)   {
            l = mid + 1
        } else {
            r = mid
        }
    }

    if matrix[r / m][r % m].intersects(target) {
        return (r / m, r % m )
    }
    return nil
}

func search(_ items: [[CGRect]], target: CGRect) -> [CGRect] {
    let rowCount = items.count
    let columnCount = items.first?.count ?? 0

    var left = (0,0)
    var right = (0,0)

}

let len = 10
let myRects = (0...3).map { r in
    return (0...3).map { c in
        CGRect(x: c * len, y: r * len, width: len, height: len)
    }
}

let targ3 = CGRect(x: 20, y: 05, width: 5, height: 1)
if let firstMatch = binarySearchMatrix(matrix: myRects, target: targ3) {
    print(firstMatch)
    var all = [CGRect]()

    // go up and down through rows and columns
    for rowIndex in 0..<firstMatch.r {
        for colIndex in 0..<firstMatch.c {
            guard myRects[rowIndex][colIndex].intersects(targ3) else { break }
            all.append(myRects[rowIndex][colIndex])
        }
    }

    for rowIndex in firstMatch.r..<myRects.endIndex {
        for col in firstMatch.c..<myRects[0].endIndex {
            guard myRects[rowIndex][col].intersects(targ3) else { break }
            all.append(myRects[rowIndex][col])
        }
    }

    print(all)
}

binarySearchMatrix(matrix: [[.zero, .init(x: 10, y: 0, width: 10, height: 10)]], target: .zero)


//: [Next](@next)
