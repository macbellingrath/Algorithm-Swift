//: [Previous](@previous)

import Foundation

class Solution {
    func reverse(_ x: Int) -> Int {
        if x == 0 || x == 1 {
            return x
        }

        var input = UInt32(exactly: x)
        var answer: UInt32 = 0
        var _x: UInt32? = input

        while let z = _x {
            let mult = UInt32.multiplyWithOverflow(answer, 10)
            let mod = UInt32.remainderWithOverflow(z, 10)
            let add = UInt32.addWithOverflow(mult.0, mod.0)

            if mult.overflow || mod.overflow || add.overflow {
                return 0
            }

            let temp = add.0
            if temp / 10 != answer {
                return 0
            }
            answer = temp
            let result = UInt32.divideWithOverflow(z, 10)
            _x = result.overflow ? nil : result.0
        }

        return Int(answer)
    }
}

//class Solution {
//    public:
//    int reverse(int x) {
//    int ans = 0;
//    while (x) {
//    int temp = ans * 10 + x % 10;
//    if (temp / 10 != ans)
//    return 0;
//    ans = temp;
//    x /= 10;
//    }
//    return ans;
//    }
//};
print(Solution().reverse(123))

//: [Next](@next)
