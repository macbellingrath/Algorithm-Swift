//: [Previous](@previous)

import Foundation
/*
 Given a digit string, return all possible letter combinations that the number could represent.

 A mapping of digit to letters (just like on the telephone buttons) is given below.
 */
class Solution {
    let charMap = ["", "1", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"]

    func letterCombinations(digits: String) -> [String] {
        if digits.isEmpty { return [] }

        var result: [String] = [""]

        for num in digits.flatMap({ Int(String($0)) }) {
            guard num > 0 && num <= 9 else { break }

            if charMap[num].isEmpty { continue }

            var temp: [String] = []

            for j in charMap[num] {
                for k in result {
                    temp.append(k + String(j))
                }
            }

            swap(&result, &temp)
        }

        return result
    }
}

let s = Solution()
s.letterCombinations(digits:"123").count


//: [Next](@next)
