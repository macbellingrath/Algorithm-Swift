//: [Previous](@previous)
/*
     9
  /    \
 5     11
 /\    /\
3  6  10 12
 */
// print the columns of a binary tree

func buildColumns(_ root: TreeNode<Int>?, map: inout [Int: [TreeNode<Int>]], height: Int) {
    guard let node = root else {
        return // leaf node
    }

    if var array = map[height] {
        array.append(node)
    } else {
        map[height] = [node]
    }

    buildColumns(root?.left, map: &map, height: height - 1)
    buildColumns(root?.right, map: &map, height: height + 1)
}



//: [Next](@next)
