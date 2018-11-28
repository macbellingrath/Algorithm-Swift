//: [Previous](@previous)

/*
 451. Sort Characters By Frequency
 Given a string, sort it in decreasing order based on the frequency of characters.
 */

class Solution {
    func frequencySort(_ s: String) -> String {
        var map: [Character: Int] = [:]  // O(n) memory
        for c in s { // O(n) time
            if let count = map[c] {
                map[c] = count + 1
            } else {
                map[c] = 1
            }
        }
        
        var res = ""
        for (char, count) in map.sorted(by: { $0.1 > $1.1 }) { // O n log n for sort
            res.append(String(repeating: char, count: count)) // O(n) to build the answer
        }
        
        return res
    }
}

Solution().frequencySort("aBBBc")
//: [Next](@next)
