//: [Previous](@previous)

import Foundation

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let xs = nums.sorted()
        var answer:[[Int]] = []

        for i in 0..<xs.count - 2 {
            if i > 0 && xs[i] == xs[i - 1] {
                continue
            }

            var l = i + 1
            var r = xs.count - 1

            while l < r {
                let s = xs[i] + xs[l] + xs[r]
                if s < 0 {
                    l += 1
                } else if s > 0 {
                    r -= 1
                } else {
                    answer.append([xs[i], xs[l], xs[r]])
                    while l < r && xs[l] == xs[l + 1] {
                        l += 1
                    }
                    while l < r && xs[r] == xs[r - 1] {
                        r -= 1
                    }

                    l += 1
                    r -= 1
                }
            }
        }



        return answer
    }
}

let input = [-1,0,1,2,-1,-4]
print(Solution().threeSum(input))

//: [Next](@next)
