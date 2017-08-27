//: [Previous](@previous)

import Foundation

class Solution {
    func findComplement(_ num: Int) -> Int {
        return Int.init(
            String(num, radix: 2).characters
                .reversed()
                .flatMap({ String($0) })
                .joined()
            )!
    }
}

print(String(5, radix: 2))
//: [Next](@next)
