//: [Previous](@previous)

import Foundation

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        let reversed = String(x).characters.reversed().flatMap({ String($0) }).joined()
        return Int(reversed) == x
    }
}

//: [Next](@next)
