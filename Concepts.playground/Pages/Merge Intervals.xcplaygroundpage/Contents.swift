//: [Previous](@previous)

import Foundation
//Definition for an interval.
public class Interval {
    public var start: Int
    public var end: Int
    public init(_ start: Int, _ end: Int) {
      self.start = start
      self.end = end
    }
 }

class Solution {
    func merge(_ intervals: [Interval]) -> [Interval] {
        if intervals.count < 2 {
            return intervals
        }

        // O(n log n)
        var sorted = intervals.sorted { r1, r2 in
            r1.start < r2.start
        }

        var answer: [Interval] = []

        var start = sorted[0].start
        var end = sorted[0].end

        for interval in sorted {
            if interval.start <= end {
                end = max(end, interval.end)
            } else {
                answer.append(Interval(start, end))

                start = interval.start
                end = interval.end
            }
        }

        answer.append(Interval.init(start, end))

        return answer
    }
}

//: [Next](@next)
