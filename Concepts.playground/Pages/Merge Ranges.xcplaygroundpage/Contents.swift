//: [Previous](@previous)

import Foundation

/*
 Given a list of ranges, return a list of ranges where any overlapping ranges have been merged.
 */

func merge(_ ranges: [NSRange]) -> [NSRange] {
    guard ranges.count > 1 else { return ranges }

    // sort
    let sorted = ranges.sorted { $0.lowerBound < $1.lowerBound }

    var answer: [NSRange] = []
    var i = 0

    while i < sorted.count {
        var current = sorted[i]
        var j = i + 1

        while j < sorted.count, sorted[j].lowerBound <= current.upperBound {
            let upper = max(sorted[i].upperBound, sorted[j].upperBound)
            current = NSRange(location: current.location, length: upper)
            j += 1
        }

        answer.append(current)
        i = j
    }


    return answer
}

let negRange = NSRange(location: -3, length: 9)
negRange.lowerBound
negRange.upperBound
negRange.contains(6)

let zeroRange = NSRange()

let a = NSRange(location: 0, length: 3)
let b = NSRange(location: 3, length: 10)
let c = NSRange(location: 18, length: 3)


NSUnionRange(negRange, a)

let testCaseOne: [NSRange] = [negRange, a]
let output = merge(testCaseOne)
NSEqualRanges(output[0], negRange)

/**
 Definition for an interval.
 */
public class Interval {
    public var start: Int
    public var end: Int

    public init(_ start: Int, _ end: Int) {
        assert(start <= end)

        self.start = start
        self.end = end
    }
}

extension Interval: Equatable {

   public static func == (lhs: Interval, rhs: Interval) -> Bool {
        return lhs.start == rhs.start && lhs.end == rhs.end
    }
}

class Solution {
    func merge(_ intervals: [Interval]) -> [Interval] {
        var answer: [Interval] = []

        for interval in intervals.sorted(by: { $0.start < $1.start }) {
            if answer.isEmpty || interval.start > answer[answer.count - 1].end {
                // no overlap
                answer.append(interval)
            } else {
                answer[answer.count - 1].end = max(answer[answer.count - 1].end, interval.end)
            }
        }

        return answer
    }
}

let s = Solution()
let neg = Interval(-3, 6)
let z = Interval(0, 0)
let one = Interval(0, 4)
let two = Interval(3, 10)
let three = Interval(18, 20)
s.merge([neg, one])

//: [Next](@next)
