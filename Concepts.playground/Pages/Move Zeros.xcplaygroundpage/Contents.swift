//: [Previous](@previous)

import Foundation

func moveZeros(_ nums: inout [Int]) {
    var lastNonZeroFoundAt = 0
    for i in 0..<nums.count {
        if nums[i] != 0 {
            if nums[lastNonZeroFoundAt] != nums[i] {
                swap(&nums[lastNonZeroFoundAt], &nums[i])
                lastNonZeroFoundAt += 1
            }
        }
    }
}


var xs = [0,1,2,3,0]

moveZeros(&xs)

print(xs)
//: [Next](@next)
