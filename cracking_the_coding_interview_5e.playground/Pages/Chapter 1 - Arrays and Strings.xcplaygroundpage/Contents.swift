//: [Previous](@previous)

/*
 Chapter 1. - Arrays and Strings
 */

/*
 1.1 - Implement an algorithm to determine if a string has all unique characters What if you can not use additional data structures?
 */

func allUniqueCharacters(_ str: String) -> Bool {
    var chars = Set<Character>()

    for c in str {
        if chars.contains(c) {
            return false
        }
        chars.insert(c)
    }
    return true
}

/*
 1.1 - What if you can not use additional data structures? - without additional allocations
 */

func allUniqueCharacters2(_ str: String) -> Bool {
    let sorted = Array(str.characters).sorted() // though this does incurt an O(n) operation to create the Array (bc of Swift string indexing model) and average O(n log n) for the sort.
    var i = 0
    while i < sorted.count - 1 { // O(n)
        if sorted[i] == sorted[i + 1] {
            return false
        }
        i += 1
    }

    return true
}

allUniqueCharacters2("aab")
allUniqueCharacters2("✨✨")

/* 1.2
 Write code to reverse a C-Style String (C-String means that “abcd” is represented as five characters, including the null character )
 */
func reverse(string: inout String) {
    var previous: Character?
    var current = string.first


}


/* 1.3
 Design an algorithm and write code to remove the duplicate characters in a string without using any additional buffer NOTE: One or two additional variables are fine An extra copy of the array is not
 FOLLOW UP
 Write the test cases for this method
 */

func dedupe(_ string: inout String) {

}


//: [Next](@next)
