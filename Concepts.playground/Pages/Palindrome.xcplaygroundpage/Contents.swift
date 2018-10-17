//: [Previous](@previous)

/*
 Write a function to determine if a string is a palnidrome or not.
 A string is considered if its alphanumeric characters are the same read forwards and backwards.
 */

import Foundation

extension String {

    /// Returns true if a string is a valid palindrome.
    var isPalindrome: Bool {
        let scalars = utf16

        if scalars.count < 2  { return true }

        var i = scalars.startIndex
        var j = scalars.index(before: scalars.endIndex)
        let charSet = CharacterSet.alphanumerics

        while i < j {

            guard let left = Unicode.Scalar(scalars[i]), charSet.contains(left) else {
                scalars.formIndex(after: &i) // i++ Unicode.Scalar.UTF16View is RandomAccessCollection, therefore the runtime is O(1)
                continue
            }

            guard let right = Unicode.Scalar(scalars[j]), charSet.contains(right) else {
                scalars.formIndex(before: &j) // j-- ^
                continue
            }

            guard String(left).lowercased() == String(right).lowercased() else {
                return false
            }

            scalars.formIndex(after: &i)
            scalars.formIndex(before: &j)
        }

        return true
    }
}

//: [Next](@next)

