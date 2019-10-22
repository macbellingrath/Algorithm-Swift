//: [Previous](@previous)

import Foundation
/*
 171. Excel Sheet Column Number
 Given a column title as appear in an Excel sheet, return its corresponding column number.

 For example:

     A -> 1
     B -> 2
     C -> 3
     ...
     Z -> 26
     AA -> 27
     AB -> 28
     ...

 Example 1:
 Input: "A"
 Output: 1
 Example 2:

 Input: "AB"
 Output: 28
 Example 3:

 Input: "ZY"
 Output: 701
 */
class Solution {
    private let map: [Character: Int] = [
        "A": 1,
        "B": 2,
        "C": 3,
        "D": 4,
        "E": 5,
        "F": 6,
        "G": 7,
        "H": 8,
        "I": 9,
        "J": 10,
        "K": 11,
        "L": 12,
        "M": 13,
        "N": 14,
        "O": 15,
        "P": 16,
        "Q": 17,
        "R": 18,
        "S": 19,
        "T": 20,
        "U": 21,
        "V": 22,
        "W": 23,
        "X": 24,
        "Y": 25,
        "Z": 26
    ]

    func titleToNumber(_ s: String) -> Int {
        var answer = 0
        var base = 1
        for char in s.reversed() {
            answer += ((map[char] ?? 0) * base)
            base *= 26
        }

        return answer
    }

    func titleToNumber2(_ s: String) -> Int {
        var answer = 0

        for char in s {
            answer = answer * 26 + map[char] ?? 0
        }

        return answer
    }

}

//: [Next](@next)
