//: [Previous](@previous)

import Foundation


/*:
 Given a mapping from 
 A:1 to :26, and an integer n, return the number of possible combinations.
 
 For example: 
 input: 12
 output: 2
 
 explanation:
 input can be interpreted as either A-1 and B-2 or L:12, giving us a total possible combination of 2.

 */

class Node {
    let value: String
    var left: Node?
    var right: Node?

    init(value: String) {
        self.value = value
    }
}

class OtherSolution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        var nums = nums
        permuteRecursive(&nums, begin: 0, result: &result)

        return result
    }

    func permuteRecursive(_ nums: inout [Int], begin: Int, result: inout [[Int]]) {
        if begin >= nums.count {
            result.append(nums)
            return
        }

        for i in begin..<nums.count {
            _swap(&nums[begin], &nums[i])
            permuteRecursive(&nums, begin: begin + 1, result: &result)
            _swap(&nums[begin], &nums[i])
        }
    }

    // swift fatals when swapping same element
    private func _swap<T: Equatable>(_ x: inout T, _ y: inout T) {
        if x == y { return }
        swap(&x, &y)
    }

}

class Solution {

    func solveWithTree(n: Int) -> Int {
        return 0
    }

    func solve(n: Int) -> Int {
        if n <= 0 {
            return 0
        }

        // split n into digits
        let digits = split(n: n)

        var answer = 1
        var i = 0

        while i < digits.count {
            if i < digits.count - 2 {
                let s = Int(String(digits[i]) + String(digits[i + 1])) ?? 0
                answer += value(n: s)
            } else {
                answer += Int(String(digits[i]))!
            }

            i += 1
        }

        return answer
    }

    private let charCount = 26

    private func value(n: Int) -> Int {
        if n <= 0 || n > charCount - 1 {
            return 0
        }
        return 1
    }

    private func split(n: Int) -> [Int] {
        return String(n)
            .characters
            .flatMap({ Int(String($0)) })
    }
}

let solution = Solution()

/* test case one
input: 1111
 should return 5
  1 - A, A, A, A (1 1 1 1)
  2 - K, K (11, 11)
  3 - A, A, K (1, 1, 11)
  4 - A, K , A ( 1, 11, 1)
  5 - K, A, A ( 11, 1, 1)
*/

solution.solve(n: 1111)

/* test case two
 input: 0
 should return 0
 */
solution.solve(n: 0)


/* test case three
 input: 979
 should return 3
 1 - null 9
 2 - 9 null
 3 - 9 7 9 

 */
solution.solve(n: 979) // is returning 17????



let o = OtherSolution()
print(o.permute([1,2,3]).count)

//: [Next](@next)
