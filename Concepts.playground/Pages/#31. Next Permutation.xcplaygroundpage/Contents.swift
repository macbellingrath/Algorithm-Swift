//: [Previous](@previous)

/*
 Implement next permutation, which rearranges numbers into the lexicographically next greater permutation of numbers.

 If such arrangement is not possible, it must rearrange it as the lowest possible order (ie, sorted in ascending order).

 The replacement must be in-place, do not allocate extra memory.

 Here are some examples. Inputs are in the left-hand column and its corresponding outputs are in the right-hand column.
 1,2,3 → 1,3,2
 3,2,1 → 1,2,3
 1,1,5 → 1,5,1
 */

import Foundation

class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        guard nums.count > 1 else { return }

        // look at first number, is it highest number? , then make lowest
        var i = nums.count - 2

        while i > -1 && nums[i] > nums[i + 1] {
            i -= 1
        }

        if i > -1 {
            var j = nums.count - 1
            while nums[j] < nums[i] {
                j -= 1
            }
            nums.swapAt(i, j)
        }


        var k = i + 1
        var y = nums.count - 1

        while k < y {
            nums.swapAt(k, y)

            k += 1
            y -= 1
        }
    }
}

let solution = Solution()

// Test Cases
var testOne = [1,2,3]
solution.nextPermutation(&testOne)
testOne
testOne == [1,3,2]

var testTwo = [3,2,1]
solution.nextPermutation(&testTwo)
testTwo
testTwo == [1,2,3]

var testThree = [1,1,5]
solution.nextPermutation(&testThree)
testThree
testThree == [1,5,1]

//: [Next](@next)
