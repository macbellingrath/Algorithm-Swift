//: [Previous](@previous)

/**
49. Group Anagrams
 Given an array of strings, group anagrams together.

 Example:

 Input: ["eat", "tea", "tan", "ate", "nat", "bat"],
 Output:
 [
   ["ate","eat","tea"],
   ["nat","tan"],
   ["bat"]
 ]
 Note:

 All inputs will be in lowercase.
 The order of your output does not matter.
 */
class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        let offset = Character("a").asciiValue!

        var map: [Int: [String]] = [:] // O(n)

        for str in strs { // O(n)
            var val = 0
            for char in str.utf8 {
                val += Int(char - offset)
            }
            map[val] = (map[val] ?? []) + [str]
        }

        var res: [[String]] = [] // O(n)
        for (_, group) in map { // O(n)
            res.append(group)
        }
        return res
    }
}

//: [Next](@next)
