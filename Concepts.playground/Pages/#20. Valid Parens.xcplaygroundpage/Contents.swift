//: [Previous](@previous)

import Foundation

class Solution {
    func isValid(_ s: String) -> Bool {
        let map: [Character: Character] = [
            "(":")",
            "{":"}",
            "[":"]"
        ]
        var stack: [Character] = []

        for c in s {
            if let rightCounterpart = map[c] {
                stack.append(rightCounterpart)
            } else if stack.popLast() != c {
                return false
            }
        }

        return stack.isEmpty
    }
}

//: [Next](@next)
