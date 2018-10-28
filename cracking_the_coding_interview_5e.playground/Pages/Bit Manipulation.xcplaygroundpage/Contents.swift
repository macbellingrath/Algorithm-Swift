//: [Previous](@previous)

// helpers
extension BinaryInteger {
    var binaryString: String {
        return String(self, radix: 2)
    }
}


let x: Int8 = 2 // 64 bit
x.leadingZeroBitCount
String(x, radix: 2)

let y: Int8 = 1
y.leadingZeroBitCount

String(y, radix: 2)
String(0xAB, radix: 2)
Int8.max
Int8(clamping:  0xAB)
0x11
0xAB + 0x11
//let num = UInt16(bitPattern: 0xAB)
//num.leadingZeroBitCount

/* 5.4 Explain what the following code does: ((n & (n-1)) == 0) */

let n: Int8 = 8
String(n-1, radix: 2)
String(n, radix: 2)
(n & (n-1))


/*
 5.1
 You are given two 32-bit numbers, N and M, and two bit positions, i and j Write a method to set all bits between i and j in N equal to M (e g , M becomes a substring of N located at i and starting at j)
 SOLUTION
 EXAMPLE:
 Input: N = 10000000000, M = 10101, i = 2, j = 6 Output: N = 10001010100
 */
func updateBits(n: Int, m: Int, i: Int, j: Int) -> Int {
    let max = ~Int(0)
    let left = max - ((Int(1) << j) - Int(1))
    let right = ((Int(1) << i) - Int(1))
    
    let mask = left | right
    return (n & mask) | (m << i)
}

let m: UInt32 = ~(0)
m.binaryString
let one: UInt32 = 1
let six: UInt32 = 6

one.binaryString
six.binaryString
one << six
(one << six).binaryString // "1000000"
((one << six) - 1).binaryString //"0111111"
(one << six).binaryString

(m - ((one << six) - one)).binaryString

updateBits(n: 10000000000, m: 10101, i: 2, j: 6).binaryString

//String(repeating: "0", count: 8 - b.count)
//: [Next](@next)
