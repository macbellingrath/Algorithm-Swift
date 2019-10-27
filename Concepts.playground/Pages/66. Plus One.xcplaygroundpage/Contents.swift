//: [Previous](@previous)

/**
 66. Plus One
Easy
Given a non-empty array of digits representing a non-negative integer, plus one to the integer.

The digits are stored such that the most significant digit is at the head of the list, and each element in the array contain a single digit.

You may assume the integer does not contain any leading zero, except the number 0 itself.

Example 1:

Input: [1,2,3]
Output: [1,2,4]
Explanation: The array represents the integer 123.
*/
class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits
        var i = digits.count - 1
        var add = 1

        while i >= 0 {
            let sum = digits[i] + add
            if sum > 9 {
                digits[i] = 0
            } else {
                digits[i] = sum
            }
            add = sum / 10
            i -= 1
        }

        if add != 0 {
            digits.insert(add, at: 0)
        }

        return digits
    }
}

//: [Next](@next)
