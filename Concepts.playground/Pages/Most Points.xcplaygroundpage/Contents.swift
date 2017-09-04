//: [Previous](@previous)

import Foundation
/*
 Given n points, find the maximum number of points that lie on the same line.
 */
struct Point: Hashable  {
    let x: Int
    let y: Int

    var hashValue: Int {
        return x.hashValue ^ y.hashValue
    }

    static func == (l: Point, r: Point) -> Bool {
        return l.hashValue == r.hashValue
    }
}

class Solution {

    /// Max Points that lie on same line in 2D plane
    ///
    /// - Parameter points: Array of Points
    /// - Returns: count of points that lie on the same line
    func maxPoints(_ points: [Point]) -> Int {
        let n = points.count
        if n < 2 {
            return n
        }

        // dictionary to hold slope and the count of points that lie on line with same slope
        var slopeMap: [Point: Int] = [:]

        var maxCount = 0, vertical = 0, overlapping = 0

        // loop through all points starting at index 0
        for i in 0..<n {
            var currentMax = 0
            vertical       = 0
            overlapping    = 0

            // loop through all points from i + 1 to the end of the array of points
            for j in (i + 1)..<n {
                // overlapping points
                if points[i] == points[j] {
                    overlapping += 1

                    //on same vertical line
                } else if points[i].x == points[j].x {
                    vertical += 1

                } else {
                    // calculate slope
                    var yDif = points[j].y - points[i].y
                    var xDif = points[j].x - points[i].x

                    // divide by gcd to avoid issues with double precision
                    let _gcd = gcd(a: yDif, b: xDif)

                    yDif /= _gcd
                    xDif /= _gcd

                    // make new point
                    let point = Point(x: xDif, y: yDif)

                    // put point in map / increment count
                    slopeMap[point] = (slopeMap[point] ?? 0) + 1

                    currentMax = max(currentMax, slopeMap[point]!)
                }

                currentMax = max(currentMax, vertical)
            }

            maxCount = max(maxCount, currentMax + overlapping + 1)
            slopeMap.removeAll(keepingCapacity: true)
        }

        return maxCount

    }

    // recurisvely calculates greatest common divisor
    private func gcd(a: Int, b: Int) -> Int {
        if b == 0 { return a }
        return gcd(a:b, b: a%b)
    }
}

let p1 = Point(x: 0, y: 2)
let p2 = Point(x: 13, y: 4)
//let p3 = Point(x: 6, y: -10)
//let p4 = Point(x: 5, y: -90)

let s = Solution()
print(s.maxPoints([p1, p2]))
    //, p3, p4]))

//: [Next](@next)
