//: [Previous](@previous)

import Foundation

/*
 class Solution:
 # @param {string} s
 # @return {integer}
 def romanToInt(self, s):
 roman = {'M': 1000,'D': 500 ,'C': 100,'L': 50,'X': 10,'V': 5,'I': 1}
 z = 0
 for i in range(0, len(s) - 1):
 if roman[s[i]] < roman[s[i+1]]:
 z -= roman[s[i]]
 else:
 z += roman[s[i]]
 return z + roman[s[-1]]
 */

class Solution {

    let romans: [Character: Int] = [
        "M": 1000,
        "D": 500,
        "C": 100,
        "L": 50,
        "X": 10,
        "V": 5,
        "I": 1,
    ]

    func romanToInt(_ s: String) -> Int {
        var answer = 0

        var i = s.startIndex
        while i < s.endIndex {
            let current = romans[s[i]] ?? 0

            let next: Int = {
                let nextI = s.index(after: i)

                return nextI < s.endIndex ? (romans[s[nextI]] ?? 0) : 0
            }()


            if current < next {
                answer -= current
            } else {
                answer += current
            }

            i = s.index(after: i)
        }

        return answer
    }
}

let s = Solution()
print(s.romanToInt("foo"))
//: [Next](@next)

