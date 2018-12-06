//: [Previous](@previous)
import Foundation

func printBinary(int: Int) -> String {
    let n = String(int, radix: 2)
    print(n)
    return n
}

var n: UInt8 = 0b00000001
n <<= 2

var i = 1
i <<= 2

var one = 1
printBinary(int: one)
var two = 2
printBinary(int: two)
printBinary(int: one&two)


let num = 50
num.bitWidth
type(of: num).bitWidth
num.leadingZeroBitCount
num.trailingZeroBitCount
printBinary(int: num)

num.bigEndian
num.littleEndian
flsl(num)
//: [Next](@next)
