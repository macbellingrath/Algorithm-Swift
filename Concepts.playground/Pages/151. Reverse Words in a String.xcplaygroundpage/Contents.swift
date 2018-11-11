//: [Previous](@previous)
//
// 151. Reverse Words in a String
// Hello world => world Hello
//  Today is   Sunday =>  Sunday is Today
class Solution {
    // first approach
    func reverse(wordsInString string: String) -> String {
        var words: [String] = [] // O(n) space
        var i = string.startIndex
    
        while i < string.endIndex { // O(n) time
            while i < string.endIndex && string[i] == " " {
                string.formIndex(after: &i)
            }
            
            var temp = ""
            while i < string.endIndex && string[i] != " " {
                temp.append(string[i])
                string.formIndex(after: &i)
            }
            words.append(temp)
        }
        
        return words.reversed().joined(separator: " ")
    }
    
    // second attempt
    func reverse2(wordsInString string: String) -> String {
        return string.split(separator: " ").reversed().joined(separator: " ")
    }
}

let s = Solution()
let input = " Today is  Sunday "

compare(
    left: {
    s.reverse(wordsInString: input)
}, right: {
    s.reverse2(wordsInString: input)
})

//: [Next](@next)
