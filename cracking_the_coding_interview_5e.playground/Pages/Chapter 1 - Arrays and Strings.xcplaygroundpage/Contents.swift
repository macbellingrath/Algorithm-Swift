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



//: [Next](@next)
