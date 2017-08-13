//: [Previous](@previous)

import Foundation

/*:
 ## task 

 Given a number of size <= 999 billion, return its String  representation (for 123, return "One Hundred Twenty Three," not "123").
*/


class Solution {
    private let lessThanTwenty = ["","One","Two","Three","Four","Five","Six","Seven","Eight","Nine", "Ten","Eleven","Twelve","Thirteen","Fourteen","Fifteen","Sixteen","Seventeen","Eighteen","Nineteen"]

    private let lessThan100 = ["", "Ten", "Twenty","Thirty","Fourty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"]
    private let other = ["","Thousand", "Million", "Billion"]

    func toString(num: Int) -> String {
        if num == 0 {
            return "Zero"
        } else {
            var num = num
            var answer = ""
            var index = 0

            while num != 0  {
                if num % 1000 != 0 {
                    answer = generateString(n: num % 1000) + other[index] + " " + answer
                }
                num /= 1000
                index += 1
            }
            
            return answer
        }
    }

    private func generateString(n: Int) -> String {
        if n < 20 {
            return lessThanTwenty[n] + " "
        } else if n < 100 {
            return lessThan100[n / 10] + " " + generateString(n: n % 10)
        } else {
            return lessThanTwenty[n / 100] + "Hundred" + generateString(n: n % 100)
        }
        
    }

}

let solution = Solution()
print(solution.toString(num: 1_000_000))

//: [Next](@next)
