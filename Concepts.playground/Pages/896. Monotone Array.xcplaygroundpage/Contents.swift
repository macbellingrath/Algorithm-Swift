//: [Previous](@previous)
/*
 An array is monotonic if it is either monotone increasing or monotone decreasing.
 
 An array A is monotone increasing if for all i <= j, A[i] <= A[j].  An array A is monotone decreasing if for all i <= j, A[i] >= A[j].
 
 Return true if and only if the given array A is monotonic.
 */

class Solution {
    func isMonotonic(_ A: [Int]) -> Bool {
        var increasing = true
        var decreasing = true
        var i = 1

        while i < A.count {
            increasing = increasing && A[i - 1] <= A[i]
            decreasing = decreasing && A[i - 1] >= A[i]
            i += 1
        }
        return increasing || decreasing
    }

}

//: [Next](@next)
