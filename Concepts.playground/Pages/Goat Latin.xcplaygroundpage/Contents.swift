//: [Previous](@previous)
/*
 824. Goat Latin
 A sentence S is given, composed of words separated by spaces. Each word consists of lowercase and uppercase letters only.

 We would like to convert the sentence to "Goat Latin" (a made-up language similar to Pig Latin.)

 The rules of Goat Latin are as follows:

 If a word begins with a vowel (a, e, i, o, or u), append "ma" to the end of the word.
 For example, the word 'apple' becomes 'applema'.

 If a word begins with a consonant (i.e. not a vowel), remove the first letter and append it to the end, then add "ma".
 For example, the word "goat" becomes "oatgma".

 Add one letter 'a' to the end of each word per its word index in the sentence, starting with 1.
 For example, the first word gets "a" added to the end, the second word gets "aa" added to the end and so on.
 Return the final sentence representing the conversion from S to Goat Latin.
 */
class Solution {
    func toGoatLatin(_ S: String) -> String {
        let vowels: Set = ["a","A", "e","E", "i","I", "o","O", "u","U"]
        var res = ""
        var i = 1
        for word in S.split(separator: " ") {
            if !res.isEmpty {
                res.append(" ")
            }
            // add letter a to end of each word per index
            let suffix = String(repeating: "a", count: i)
            if vowels.contains(String(word[word.startIndex])) {
                res.append("\(word)ma\(suffix)")
            } else {
                // if word begins with consonant - remove first leeter and append it to the end + "ma"
                res.append("\(String(word[word.index(after: word.startIndex)...]))\(String(word[word.startIndex]))ma\(suffix)")
            }
            i += 1
        }
        return res
    }

}

let solution = Solution()
let answer = solution.toGoatLatin("I speak Goat Latin")
answer == "Imaa peaksmaaa oatGmaaaa atinLmaaaaa"
//: [Next](@next)
