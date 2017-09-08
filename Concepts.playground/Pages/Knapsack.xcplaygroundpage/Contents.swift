//: [Previous](@previous)

import Foundation

class NaiveSolution {
    struct Item {
        var weight: Int
        var value: Int
    }

    func knapSack(capacity: Int, items: [Item], n: Int) -> Int {
        // base case
        if capacity == 0 || n == 0 { return 0 }

        let lastIndex = n-1
        let lastItem = items[lastIndex]

        if lastItem.weight > capacity {
            return knapSack(capacity:capacity,
                            items: items,
                            n: lastIndex)
        }

        return max(
            lastItem.value + knapSack(capacity: capacity - lastItem.weight, items: items, n: lastIndex),
            knapSack(capacity: capacity, items: items, n: lastIndex)
        )
    }

    /*
It should be noted that the above function computes the same subproblems again and again. See the following recursion tree, K(1, 1) is being evaluated twice. Time complexity of this naive recursive solution is exponential (2^n).

In the following recursion tree, K() refers to knapSack().  The two 
parameters indicated in the following recursion tree are n and W.  
The recursion tree is for following sample inputs.
wt[] = {1, 1, 1}, W = 2, val[] = {10, 20, 30}

                       K(3, 2)         ---------> K(n, W)
                   /            \ 
                 /                \               
            K(2,2)                  K(2,1)
          /       \                  /    \ 
        /           \              /        \
       K(1,2)      K(1,1)        K(1,1)     K(1,0)
       /  \         /   \          /   \
     /      \     /       \      /       \
K(0,2)  K(0,1)  K(0,1)  K(0,0)  K(0,1)   K(0,0)
Recursion tree for Knapsack capacity 2 units and 3 items of 1 unit weight.
 */


}

let i1 = NaiveSolution.Item(weight: 6, value: 10)
let i2 = NaiveSolution.Item(weight: 1, value: 10)
let i3 = NaiveSolution.Item(weight: 4, value: 1)


let solution = NaiveSolution()
let items =  [i1,i2,i3]
let n = items.count
solution.knapSack(capacity: 5, items:items, n: items.count)

class OptimalSolution: NaiveSolution {

    override func knapSack(capacity: Int, items: [NaiveSolution.Item], n: Int) -> Int {
        var k: [[Int]] = []
        var w = 0

        for i in 0..<n {
            while w <= capacity {
                if i == 0 || w == 0  {
                    k[i][w] = 0
                } else if items[i-1].weight <= w {
                     k[i][w] = max(items[i-1].value + k[i-1][w-items[i-1].weight],  k[i-1][w])
                } else {
                    k[i][w] = k[i-1][w]
                }
                w += 1
            }
        }

        return k[n][w]
    }

}

let optimal = OptimalSolution()
optimal.knapSack(capacity: 5, items: items, n: items.count)
//: [Next](@next)
