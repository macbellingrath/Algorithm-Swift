//: [Previous](@previous)

// 904. Fruit Into Baskets

/*
 In a row of trees, the i-th tree produces fruit with type tree[i].

 You start at any tree of your choice, then repeatedly perform the following steps:

 Add one piece of fruit from this tree to your baskets.  If you cannot, stop.
 Move to the next tree to the right of the current tree.  If there is no tree to the right, stop.
 Note that you do not have any choice after the initial choice of starting tree: you must perform step 1, then step 2, then back to step 1, then step 2, and so on until you stop.

 You have two baskets, and each basket can carry any quantity of fruit, but you want each basket to only carry one type of fruit each.

 What is the total amount of fruit you can collect with this procedure?
*/

class Solution {
    func totalFruit(_ tree: [Int]) -> Int {
        var answer = 0

        guard tree.count > 1 else {
            return tree.count
        }

        var i = 0
        var j = 1
        while j < tree.count {
            var temp = 1
            var set: Set<Int> = [tree[i]]

            while j < tree.count && set.count < 2 && !set.contains(tree[j]) {
                set.insert(tree[j])
                temp += 1
                j += 1
            }

            while j < tree.count && set.contains(tree[j]) {
                temp += 1
                j += 1
            }



            answer = max(answer, temp)
            i += 1
            j = i + 1
        }

        return answer
    }

}

let s = Solution()
let testCaseOne = [1,2,1]

let output1 = s.totalFruit(testCaseOne)
output1 == 3

let testCaseTwo = [0,1,2,2]
let output2 = s.totalFruit(testCaseTwo)
output2 == 3

let testCaseThree = [1,2,3,2,2]
let output3 = s.totalFruit(testCaseThree)
output3 == 4

let testCaseFour =  [3,3,3,1,2,1,1,2,3,3,4]
let output4 = s.totalFruit(testCaseFour)
output4 == 5

let testTwoElements = [1,1]
let outputTwoElements = s.totalFruit(testTwoElements)
outputTwoElements == 2

let testOneElement = [2]
let outputOneElement = s.totalFruit(testOneElement)
outputOneElement == 1

let failingTest = [0,0,1,1]
let failingOutput = s.totalFruit(failingTest)
failingOutput == 4

let failingTwo = [0,1,6,6,4,4,6]
let failingTwoOutput = s.totalFruit(failingTwo)
failingTwoOutput == 5

//: [Next](@next)
