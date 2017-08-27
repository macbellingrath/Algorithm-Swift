//: [Previous](@previous)

import Foundation

class Solution {
    func myAtoi(_ str: String) -> Int {
        let clean = str.trimmingCharacters(in: .whitespacesAndNewlines)

        if clean.isEmpty {
            return 0
        }

        // length
        let length = clean.characters.count // 1 

        assertionFailure("not yet implemented")
        return 0
    }
}


// test input 
// "0"


//: [Next](@next)
