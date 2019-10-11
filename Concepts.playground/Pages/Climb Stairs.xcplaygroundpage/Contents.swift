//: [Previous](@previous)

/*
 You are climbing a stair case. It takes n steps to reach to the top.

Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
 */
class Solution {
    private var memo: [Int: Int] = [:]

    func climbStairs(_ n: Int) -> Int {
      if let cached = memo[n] {
        return cached
      }

      memo[n] = n <= 3 ? n : climbStairs(n - 1) + climbStairs(n - 2)
      return memo[n] ?? 0
    }
}




//: [Next](@next)
