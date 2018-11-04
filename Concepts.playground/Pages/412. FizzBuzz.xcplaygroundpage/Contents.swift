//: [Previous](@previous)


class Solution {
    func fizzBuzz(_ n: Int) -> [String] {
        guard n > 0 else { return [] }
        let fizz  = "Fizz"
        let buzz = "Buzz"
        let fizzBuzz = "FizzBuzz"
        
        var res: [String] = []
        
        for i in 1...n {
            if i % 3 == 0 {
                res.append(i % 5 == 0 ? fizzBuzz : fizz)
            } else if i % 5 == 0 {
                res.append(buzz)
            } else {
                res.append("\(i)")
            }
        }
        
        return res
    }
}
//: [Next](@next)
