//: [Previous](@previous)

import Foundation

class Solution {
    func reverse(_ x: Int) -> Int {
        var x = x
        var result = 0
        while x != 0 {
            let tail = x % 10
            let newResult = result * 10 + tail
            if (newResult - tail) / 10 != result { return 0 }
            result = newResult
            x = x / 10
        }

        if Int32(exactly: result) == nil  { return 0 }

        return Int32(exactly: result).flatMap(Int.init) ?? 0
    }
}



print(Solution().reverse(-123))

//: [Next](@next)
/*
public int reverse(int x)
{
    int result = 0;

    while (x != 0)
    {
        int tail = x % 10;
        int newResult = result * 10 + tail;
        if ((newResult - tail) / 10 != result)
        { return 0; }
        result = newResult;
        x = x / 10;
    }

    return result;
}
 */