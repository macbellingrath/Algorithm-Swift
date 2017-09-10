//: [Previous](@previous)

import Foundation


class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let h = Array(haystack.characters)
        let n = Array(needle.characters)

        // swift range init doesn't form range with  lowerbound > upperbound
        if n.count > h.count { return -1 }

        for i in 0...h.count - n.count {
            if String(h[i..<i+n.count]) == needle { return i }
        }

        return -1
    }
}

let s = Solution()
s.strStr(" as", "s")
//: [Next](@next)
