//: [Previous](@previous)

import Foundation

func mergeSort<T: Comparable>(_ items: [T]) -> [T] {
    let count = items.count
    guard count > 1 else {
        return items
    }

    let midPoint = count / 2

    let leftPile = Array(items[items.startIndex..<midPoint])
    let rightPile = Array(items[midPoint..<items.endIndex])

    return merge(leftPile: mergeSort(leftPile), rightPile: mergeSort(rightPile))
}

func merge<T: Comparable>(leftPile: [T], rightPile: [T]) -> [T] {
    var leftIndex = 0
    var rightIndex = 0
    var sortedPile: [T] = []

    while leftIndex < leftPile.count && rightIndex < rightPile.count {
        if leftPile[leftIndex] < rightPile[rightIndex] {
            sortedPile.append(leftPile[leftIndex])
            leftIndex += 1
        } else if leftPile[leftIndex] > rightPile[rightIndex] {
            sortedPile.append(rightPile[rightIndex])
            rightIndex += 1
        } else {
            sortedPile.append(leftPile[leftIndex])
            leftIndex += 1

            sortedPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
    }

    while leftIndex < leftPile.count {
        sortedPile.append(leftPile[leftIndex])
        leftIndex += 1
    }

    while rightIndex < rightPile.count {
        sortedPile.append(rightPile[rightIndex])
        rightIndex += 1
    }

    return sortedPile
}


mergeSort([9,91293,12012,-1,99,0])
//: [Next](@next)