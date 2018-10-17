//: [Previous](@previous)

/*
 Write a function to determine if a string is a palnidrome or not.
 A string is considered if its alphanumeric characters are the same read forwards and backwards.
 */

import Foundation

extension String {

    /// Returns true if a string is a valid palindrome.
    var isPalindrome: Bool {
        if isEmpty { return false }

        let scalars = unicodeScalars
        var i = scalars.startIndex
        var j = scalars.index(before: scalars.endIndex)
        let charSet = CharacterSet.alphanumerics

        while i < j {
            if !charSet.contains(scalars[i]) {
                scalars.formIndex(after: &i) // i++
            } else if !charSet.contains(scalars[j]) {
                scalars.formIndex(before: &j) // j--
            } else if String(scalars[i]).lowercased() != String(scalars[j]).lowercased() {
                return false
            } else  {
                scalars.formIndex(after: &i)
                scalars.formIndex(before: &j)
            }
        }

        return true
    }
}
//: [Next](@next)

