//: [Previous](@previous)

import Foundation



final class Solution {
    static let m = ["", "M", "MM", "MMM"]
    static let c = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]
    static let x = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]
    static let i = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]

    /// convert int to roman.
    /// Must be in range 1...3999
    ///
    /// - Parameter num: number between 1 and 39999
    /// - Returns: roman numeral representation
    final func intToRoman(_ num: Int) -> String {
        return Solution.intToRoman(num)
    }

    private static func intToRoman(_ num: Int) -> String {
        return
                m[num/1000] +
                c[(num%1000)/100] +
                x[(num%100)/10] +
                i[num%10]
    }
}

let s = Solution()
s.intToRoman(58)
//: [Next](@next)
