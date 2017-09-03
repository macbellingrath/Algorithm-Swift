//: [Previous](@previous)

import Foundation

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.isEmpty { return "" }

        var minLength = Int.max

        for s in strs {
            minLength = min(minLength, s.characters.count)
        }

        var low = 1
        var high = minLength
        while low <= high {
            let middle = (low + high) / 2
            low = isCommonPrefix(strs: strs, length: middle) ? middle + 1 : middle - 1
        }

        let str = strs[0]
        return str.substring(to: str.index(str.startIndex, offsetBy: (low + high / 2)))
    }

    private func isCommonPrefix(strs: [String], length: Int) -> Bool {
        let str = strs[0].substring(with: Range<String.Index>.init(uncheckedBounds: (lower: strs[0].startIndex, upper: strs[0].endIndex)))

        for i in 1..<strs.count {
            if !strs[i].hasPrefix(str) {
                return false
            }
        }

        return true
    }
}

let s = Solution()
s.longestCommonPrefix(["car", "cars", "caring"])
//: [Next](@next)
