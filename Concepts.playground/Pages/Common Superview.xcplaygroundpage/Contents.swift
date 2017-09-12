//: [Previous](@previous)

import Foundation
import UIKit

func commonSuperView(_ lhs: UIView, _ rhs: UIView) -> UIView? {
    if lhs.superview == nil || rhs.superview == nil {
        return nil
    }

    // build list 
    var s = Set<UIView>()
    var current = lhs.superview

    while let next = current {
        s.insert(next)
        current = next.superview
    }

    // check list 
    var other = rhs.superview

    while let next = other {
        if s.contains(next) {
            return next
        }
        other = next.superview
    }

    return nil
}

// test cases 
let v1 = UIView()
let v2 = UIView()
let v3 = UIView()
v1.addSubview(v2)
v1.addSubview(v3)

print(commonSuperView(v2, v3))

//: [Next](@next)
