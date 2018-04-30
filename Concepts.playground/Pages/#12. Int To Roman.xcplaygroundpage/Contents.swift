//: [Previous](@previous)

import Foundation



class Solution {
    let m = ["", "M", "MM", "MMM"]
    let c = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]
    let x = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]
    let i = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]

    /// convert int to roman.
    /// Must be in range 1...3999
    ///
    /// - Parameter num: number between 1 and 39999
    /// - Returns: roman numeral representation
    func intToRoman(_ num: Int) -> String {
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
