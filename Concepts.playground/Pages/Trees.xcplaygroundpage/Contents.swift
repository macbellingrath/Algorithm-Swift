//: [Previous](@previous)

func calculate_height(_ root: TreeNode<Int>?) -> Int {
    guard let root = root else { return 0 }

    return max(calculate_height(root.left) + 1,
               calculate_height(root.right) + 1)
}
let a = TreeNode(1)
let b = TreeNode(2)
let c = TreeNode(3)
let d = TreeNode(4)

a.left = b
a.right = c
c.right = d


func levelOrder(_ root: TreeNode<Int>?, height: Int) {
    guard let root = root else { return }

    if height == 1 {
        print(root.value)
    } else if height > 1 {
        levelOrder(root.left, height: height - 1)
        levelOrder(root.right, height: height - 1)
    }
}

for h in stride(from: calculate_height(a), through: 1, by: -1) {
    levelOrder(a, height: h)
}

//: [Next](@next)
