//: [Previous](@previous)

class Solution {
    func getSum(_ a: Int, _ b: Int) -> Int {
        return b == 0 ? a : getSum(a ^ b, ((a & b) << 1))
    }
}


Solution().getSum(2, -3)

var a = 2
var b = -3

a ^ b
(a&b)
(a&b) << 1

var c = 1 // 0001
var d = 9 // 1001
Solution().getSum(c, d) //1010
c ^ d  // 1000
(c&d)  // 0001
(c&d) << 1 // 0010
//: [Next](@next)

