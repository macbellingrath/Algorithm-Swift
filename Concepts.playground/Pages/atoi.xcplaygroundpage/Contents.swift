//: [Previous](@previous)

import Foundation
/*
 int atoi(const char *str) {
 int sign = 1, base = 0, i = 0;
 while (str[i] == ' ') { i++; }
 if (str[i] == '-' || str[i] == '+') {
 sign = 1 - 2 * (str[i++] == '-');
 }
 while (str[i] >= '0' && str[i] <= '9') {
 if (base >  INT_MAX / 10 || (base == INT_MAX / 10 && str[i] - '0' > 7)) {
 if (sign == 1) return INT_MAX;
 else return INT_MIN;
 }
 base  = 10 * base + (str[i++] - '0');
 }
 return base * sign;
 }*/

class Solution {
    func myAtoi(_ str: String) -> Int {
        let _str = Array(str.trimmingCharacters(in: .whitespaces).characters)

        if _str.isEmpty {
            return .min
        }

        var sign = 1, base = 0, i = 0

        if _str[i] == "-" || _str[i] == "+" {
            i += 1
            sign =  1 - 2 * (_str[i] == "-" ? 1 : 0)
        }

        while _str[i] >= "0" && _str[i] <= "9" {
            if base > .max / 10 ||  (base == .max / 10 && _str[i] > "7") {
                return sign == 1 ? .max : .min
            }

            //base = 10 * base + _str[i]
        }

        return base * sign
    }
}


// test input 
// "0"


//: [Next](@next)
