//: [Previous](@previous)

import Foundation

func minDifferences(_ nums: [Int]) -> [(Int, Int)] {
    if nums.count < 2 { return [] }

    let nums = nums.sorted()
    var minDifference = Int.max
    var answer: [Int: [(Int, Int)]] = [:]

    for i in 0..<nums.count - 1 {
        let n1 = nums[i]
        let n2 = nums[i + 1]
        let difference = abs(n1 - n2)

        if answer[difference] != nil {
            answer[difference]!.append((n1, n2))
        } else {
            answer[difference] = [(n1, n2)]
        }

        minDifference = min(minDifference, difference)
    }


    return answer[minDifference] ?? []
}



let input = [-8, 0, 1, 2]

print(minDifferences(input))

/*  Complexity Analysis

 Time
  - Sorting -> Swift standard library uses introsort with time complexity of O(n log n )
  - 1 loop to calculate differences and memoize them in dictionary O(n)
  - overall complexity of O(n log n)

 Space
  - Sorted copy of input -> O(n)
  -  O(n) space for dictionary
  - overall complexity O(n)
*/


//: [Next](@next)
