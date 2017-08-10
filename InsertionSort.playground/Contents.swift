/*:
 # Insertion Sort
 **Time Complexity:**
 best case - O(n)
 worst case - O(n^2)
*/
func insertionSort<T: Comparable>(a: inout [T]){
    var i = 0
    while i < a.count {
        var j = i
        while j > 0 && a[j] < a[j - 1] {
            swap(&a[j - 1], &a[j])
            j -= 1
        }
        i += 1
    }
}

var ns = [1,5,2,1,12,4,0,1,2,0,0,1,2,0,19,5,100,1]
insertionSort(a: &ns)
print(ns)
