//: [Previous](@previous)

/*
 # 38 - Count and Say
 The count-and-say sequence is the sequence of integers with the first five terms as following:
 ```
 1.     1
 2.     11
 3.     21
 4.     1211
 5.     111221
 ```

 - 1 is read off as "one 1" or 11.
 - 11 is read off as "two 1s" or 21.
 - 21 is read off as "one 2, then one 1" or 1211.
 - Given an integer n, generate the nth term of the count-and-say sequence.

 Note: Each term of the sequence of integers will be represented as a string.

*/

class Solution {
    func countAndSay(_ n: Int) -> String {
        if n < 1 { return "" }
        if n == 1 { return "1" }

        var answer = "1"
        for i in 1..<n {
            var temp = ""
            var count = 1
            let chars = Array(answer.characters)

            for j in 1...answer.count {
                if j == chars.count || chars[j - 1] != chars[j] {
                    temp.append("\(count)\(chars[j-1])")
                    count = 1
                } else {
                    count += 1
                }
            }
            answer = temp
        }

        return answer
    }

}

let s = Solution()

// Test Cases
let example1 = 1
let zero = 0
let negative = -5

s.countAndSay(example1)
s.countAndSay(zero)
s.countAndSay(negative)
s.countAndSay(5)


//: [Next](@next)
