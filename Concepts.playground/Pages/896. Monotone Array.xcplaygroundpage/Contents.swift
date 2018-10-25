//: [Previous](@previous)
/*
 An array is monotonic if it is either monotone increasing or monotone decreasing.
 
 An array A is monotone increasing if for all i <= j, A[i] <= A[j].  An array A is monotone decreasing if for all i <= j, A[i] >= A[j].
 
 Return true if and only if the given array A is monotonic.
 */

class Solution {
    func isMonotonic(_ A: [Int]) -> Bool {
        let count = A.count // compute once
        var i = 1
        while (i <= count - 1) && A[i - 1] == A[i] {
            i += 1
        }
        
        if i >= count { return true }
        
        
        let compare: (Int, Int) -> Bool = (A[i - 1] < A[i]) ? (<=) : (>=)
        
        while i <= count - 1 {
            if !(compare(A[i - 1], A[i])) { return false }
            i += 1
        }
        return true
    }
}
//: [Next](@next)
