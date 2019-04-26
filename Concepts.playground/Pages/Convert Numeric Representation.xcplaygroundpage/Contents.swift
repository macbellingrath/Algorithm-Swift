//: [Previous](@previous)


/*
 Convert number in one base into another
 */
import Foundation

// 110 -> 06

func convert(representation: String, base: Int) -> Int {
    // convert to base 10
    var i = representation.indices.last!
    var j = 0
    var result = 0
    // O(n)
    while i >= representation.startIndex {
        result += (Int(pow(Double(base), Double(j))) * Int(String(representation[i]))!)
        j += 1

        if i == representation.startIndex {
            break
        }
        representation.formIndex(before: &i)
    }
    return result
}

func convert(representation: String, base: Int, toBase newBase: Int) -> String {
    // convert to base 10 - O(n) time
    let base10 = convert(representation: representation, base: base)
    // convert to new base
    // divide base10 number by newBase
    var quotient = base10 / newBase
    var remainder = base10 % newBase
    var result = String(remainder)

    // O(log base newBase of base 10)
    while quotient > newBase {
        remainder = quotient % newBase
        result += String(remainder)
        quotient /= newBase
    }

    result += String(quotient)

    // O(n)
    return String(result.reversed())
}


convert(representation: "1", base: 2)
convert(representation: "10", base: 2, toBase: 4)
convert(representation: "999", base: 10, toBase: 2)
//: [Next](@next)
