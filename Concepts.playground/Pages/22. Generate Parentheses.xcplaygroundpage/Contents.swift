//: [Previous](@previous)

import Foundation

/*
 22. Generate Parentheses
 Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
 
 For example, given n = 3, a solution set is:
    [
        "((()))",
        "(()())",
        "(())()",
        "()(())",
        "()()()"
    ]
 */
class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var answer: [String] = []
        addingParenthesis(&answer, str: "", n: n, m: 0)
        return answer
        
    }
    
    private func addingParenthesis(_ solution: inout [String], str: String, n: Int, m: Int) {
        // base case
        if n == 0 && m == 0 {
            solution.append(str)
            return
        }
        
        if m > 0 {
            addingParenthesis(&solution, str: str + ")", n: n, m: m - 1)
        }
        
        if n > 0 {
            addingParenthesis(&solution, str: str + "(", n: n - 1, m: m + 1)
        }
    }
}

let s = Solution()
s.generateParenthesis(3)
s.generateParenthesis(1)
s.generateParenthesis(0)
s.generateParenthesis(-1)
//: [Next](@next)
