//: [Previous](@previous)

/**
 139. Word Break

 Given a non-empty string s and a dictionary wordDict containing a list of non-empty words, determine if s can be segmented into a space-separated sequence of one or more dictionary words.

 Note:

 The same word in the dictionary may be reused multiple times in the segmentation.
 You may assume the dictionary does not contain duplicate words.

 Example:
 Input: s = "applepenapple", wordDict = ["apple", "pen"]
 Output: true
 Explanation: Return true because "applepenapple" can be segmented as "apple pen apple".
              Note that you are allowed to reuse a dictionary word.

 Example:
 Input: s = "catsandog", wordDict = ["cats", "dog", "sand", "and", "cat"]
 Output: false
 */

class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let dictionary = Set(wordDict)
        var canBeBroken = Array(repeating: false, count: s.count + 1)
        canBeBroken[0] = true

        let chars = Array(s)
        for i in 1...chars.count {
            for j in 0..<i {
                if canBeBroken[j] && dictionary.contains(String(chars[j..<i])) {
                    canBeBroken[i] = true
                    break
                }
            }
        }
        return canBeBroken[chars.count]
    }
}

//: [Next](@next)
